# encoding: utf-8

require 'csv'

class Hotel < ActiveRecord::Base
  belongs_to :booking
  belongs_to :city
  #belongs_to :hotelier_hotel

  has_many :filter_values, class_name: 'Hotel::Filter::Value', dependent: :delete_all
  has_many :service_values, class_name: 'Hotel::Service::Value', dependent: :delete_all
  has_many :reviews, dependent: :delete_all
  has_many :rooms, dependent: :delete_all
  has_many :images, dependent: :delete_all
  has_many :special_offers, dependent: :delete_all
  has_many :bank_attributes, dependent: :delete_all
  #has_many :hotelier_hotels
  #has_many :users, :through => :hotelier_hotels

  strip_attributes

  accepts_nested_attributes_for :service_values, allow_destroy: true
  accepts_nested_attributes_for :filter_values, allow_destroy: true
  accepts_nested_attributes_for :images, allow_destroy: true
  accepts_nested_attributes_for :rooms, allow_destroy: true
  accepts_nested_attributes_for :special_offers, allow_destroy: true
  accepts_nested_attributes_for :bank_attributes, allow_destroy: true

  attr_accessible :street, :name, :description, :phone, :email, :site, :route_description, :iin, :kpp, :ogrn, :legal_address, :post_address, :street_number, :way, :booking_description, :published, :city_id, :street_id, :booking_id,
    :min_age_children, :adjacent_territory, :checkout_time, :documents, :agency_commission, :map_latitude, :map_longitude, :find_city, :street,
    :bank_attributes_attributes, :special_offers_attributes, :images_attributes, :rooms_attributes, :service_values_attributes, :filter_values_attributes, :all_rooms_count

  has_attached_file :way, styles: { thumb: '160x120>' }
  liquid_methods :name, :description, :mail, :site, :route_description, :iin, :kpp, :ogrn,
    :city, :booking, :filter_values, :service_values, :reviews, :rooms, :images, :special_offers, :bank_attributes, :retval

  # Validations
  validates :name, presence: true
  validates :name, length: { minimum: 2, maximum: 255 }

  #validates_associated :filter_values, :service_values, :rooms, :images, :special_offers, :bank_attributes

  scope :published, conditions: { published: true }

  def self.sort_column_names
    %w[hotels.name hotel_cities.name hotels.reviews_count hotels.street_id hotels.images_count hotels.rooms_count hotels.min_price_summer hotels.min_age_children hotels.all_rooms_count]
  end

  def self.create_from_csv_row row
    name, type, city, street, street_number, phone = row

    return [false, 'Не найдено имя гостиницы'] unless name

    Hotel.transaction do
      city = Hotel::City.find_or_create_by_name city.strip

      if name && (hotel = find(:first, conditions: [ 'lower(name) = lower(?)', name.strip ]))
        { name: name, city_id: city.id, street: street, street_number: street_number, phone: phone }.each do |name, value|
          hotel.update_column name, value
        end
      else
        attributes = { name: name, city_id: city.id, street: street, street_number: street_number, phone: phone }

        unless type.nil?
          filter = Hotel::Filter.find_by_name 'Тип'
          return [false, "Не найден фильтр \"Тип\""] unless filter

          filter_item = filter.items.find :first, conditions: [ 'lower(name) = lower(?)', type.strip ]
          filter_item = filter.items.find :first, conditions: [ 'lower(name) = lower(?)', "Гостиница" ]

          return  [false, "Не найден тип гостиницы \"Гостиница\""] unless filter_item

          attributes[:filter_values] = [Hotel::Filter::Value.create(filter_id: filter.id, item_id: filter_item.id)]
        end

        record = Hotel.new attributes, without_protection: true

        unless record.save(validate: false)
          return [false, "Не удалось сохранить"]
        end
      end
    end

    [true, '']
  end

  def self.to_csv rows
    CSV.generate do |csv|
      rows.each do |r|
        csv << [r.name, r.city, r.street, r.street_number, r.phone]
      end
    end
  end

  def self.search params
    query = self

    if params[:filters]
      params[:filters].each do |filter_id, item_id|
        item_id = item_id.to_i
        filter_id = filter_id.to_i

        query = query.joins("inner join hotel_filter_values filter#{filter_id}
          on hotels.id = filter#{filter_id}.hotel_id
            and filter#{filter_id}.filter_id=#{filter_id}
            and filter#{filter_id}.item_id=#{item_id}") if item_id > 0
      end
    end

    if params[:services]
      params[:services].each do |service_id, value|
        service_id = service_id.to_i

        query = query.joins("inner join hotel_service_values service#{service_id}
          on hotels.id = service#{service_id}.hotel_id
            and service#{service_id}.service_id=#{service_id}")
      end
    end

    conditions = []

    if params[:has_special_offers]
      conditions << ['special_offers_count > ?', 0]
    end

    # conditions from hotel data
    if params[:hotel]
      data = params[:hotel]

      #if data[:street].present?
      #  street = Street.where("LOWER(name) LIKE LOWER(?)", "%#{data[:street]}%").first
      #  conditions << ["hotels.street_id = ?", street ? street.id : '-1']
      #end

      if data[:find_city].present?
        city = City.where("LOWER(name) LIKE LOWER(?)", "%#{data[:find_city]}%").first
        conditions << ["hotels.city_id = ?", city ? city.id : '-1']
      end

      %w(name street).each do |name|
        if data[name].present?
          conditions << ["LOWER(hotels.#{name}) LIKE LOWER(?)", "%#{data[name]}%"] if data[name].length > 2
        end
      end

     %w(booking_id).each do |name|
        if data[name].present?
          conditions << ["hotels.#{name} = ?", data[name].to_i] if data[name].present?
        end
      end
    end

    if params[:ao] == '1'
      # conditions from ranges
      %w(price_summer price_high_season price_winter).each_with_index do |name, i|
        next unless params[name]
        from = params[name][:from].to_i
        to = params[name][:to].to_i
        conditions << ["rooms.#{name}_from >= ? and rooms.#{name}_from <= ?", from, to] unless from < 0 || to < 0 || from > to
      end

      # conditions from rooms params
      %w(places_count additional_places_count).each_with_index do |name, i|
        next unless params[name]
        from = params[name][:from].to_i
        to = params[name][:to].to_i
        conditions << ["rooms.#{name} >= ? and rooms.#{name} <= ?", from, to] unless from < 0 || to < 0 || from > to
      end

      query = query.joins "inner join hotel_rooms rooms on hotels.id = rooms.hotel_id"
    end

    if params[:only_without_rooms]
      conditions << ["hotels.rooms_count < ?", 1]
    end

    clauses = conditions.map { |condition| condition.first }
    options = conditions.map { |condition| condition[1..-1] }.flatten

    query.uniq.find :all, conditions: [clauses.join(' AND '), *options]
  end

  def address
    "г. #{city}, ул. #{street}, #{street_number}"
  end

  # select filters with values
  def filters
    Filter.all
  end

  # select full service list with empty values
  def services
    return Service.all if new_record?
    Service.values_for_hotel(id).all
  end

  def service_values
    super
  end

  def all_filter_values
    reject_ids = []

    filter_values.map do |item|
      reject_ids << item.filter_id
      item
    end + all_filters.reject { |i| reject_ids.include? i.id }.map { |i| filter_values.build(filter_id: i.id) }
  end

  def all_services
    Service.all
  end

  def all_filters
    Filter.all
  end

  # set street_id by name
  #def street= name
  #  @street = name
  #end

  # get street name by id
  #def street
  #  return @street if @street
  #  return nil unless street_id

  #  @street ||= Street.find(street_id)
  #  @street.name
  #end

  def find_city= value
    @city = value
  end

  def find_city
    @city
  end

  def checkout_time_list
    list = []
    24.times do |i|
      list << "#{i}:00"
      list << "#{i}:30"
    end
    list
  end

  def self.update_special_offers_count
    unscoped.all.each do |record|
      record.special_offers_count = record.special_offers.active.all.count
      record.save validate: false
    end
  end

  def self.fix_filter_values
    hotels = unscoped.pluck(:id)
    filters = Filter.pluck(:id)

    hotels.each do |hotel_id|
      filters.each do |filter_id|
        unless Filter::Value.exists? filter_id: filter_id, hotel_id: hotel_id
          Filter::Value.create filter_id: filter_id, hotel_id: hotel_id, item_id: 0
        end
      end
    end
  end

  before_save do |record|
    record.images_count = record.rooms.collect { |i| i.photos.count }.sum + record.images.count

    record.min_price_summer = record.rooms.collect { |i| i.price_summer_from || 0 }.min
    record.min_price_winter = record.rooms.collect { |i| i.price_winter_from || 0 }.min
    #record.all_rooms_count = record.rooms.collect { |i| i.all_count || 0 }.compact.sum
  end

  after_destroy do
    Service::Value.delete_all "hotel_id=#{id}"
    Filter::Value.delete_all "hotel_id=#{id}"
    Room.delete_all "hotel_id=#{id}"
    Image.delete_all "hotel_id=#{id}"
  end
end
