# encoding: utf-8

class Hotel::Room < ActiveRecord::Base
  belongs_to :hotel, counter_cache: true
  belongs_to :type

  has_many :photos, class_name: ::Hotel::Room::Photo
  has_many :field_values, class_name: Field::Value
  has_many :list_values, class_name: List::Value

  accepts_nested_attributes_for :photos, allow_destroy: true
  accepts_nested_attributes_for :field_values, allow_destroy: true
  accepts_nested_attributes_for :list_values, allow_destroy: true

  default_scope order: :type_id

  strip_attributes

  liquid_methods :name, :type, :price_summer_from, :price_summer_to, :price_high_season_from, :price_high_season_to, :price_winter_from, :price_winter_to, :places_count, :additional_places_count, :area, :all_count, :hotel

  attr_accessible :name, :photos_attributes, :field_values_attributes, :type_id, :places_count, :additional_places_count, :area, :all_count, :price_summer_from,
    :price_summer_to, :price_high_season_from, :price_high_season_to, :price_winter_from, :price_winter_to,
    :list_values_attributes

  def all_field_values
    reject_ids = []

    values = field_values.map do |item|
      reject_ids << item.field_id
      item
    end + Field.all.reject { |i| reject_ids.include? i.id }.map { |i| field_values.build(field_id: i.id) }

    values.sort { |x, y| x.field.position <=> y.field.position }
  end

  def all_list_values
    reject_ids = []

    values = list_values.map do |item|
      reject_ids << item.list_id
      item
    end + List.all.reject { |i| reject_ids.include? i.id }.map { |i| list_values.build(list_id: i.id) }

    values.sort { |x, y| x.list.position <=> y.list.position }
  end

  after_destroy do |record|
    Field::Value.delete_all "room_id=#{record.id}"
    Photo.delete_all "room_id=#{record.id}"
  end

  def add_to_ticket
    @add_to_ticket ||= true
  end

  def add_to_ticket= value
    @add_to_ticket = value
  end

  def price_summer
    "#{price_summer_from} руб."
  end

  def price_high_season
    "#{price_high_season_from} руб."
  end

  def price_winter
    "#{price_winter_from} руб."
  end
end
