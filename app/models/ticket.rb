class Ticket < ActiveRecord::Base
  attr_accessible :agency_id, :camper_id, :closed, :message_attributes, :rooms_attributes, :room_ids

  belongs_to :moderator, class_name: User::Moderator
  belongs_to :agency, class_name: User::Agency
  belongs_to :camper, class_name: User::Camper
  belongs_to :closer, class_name: User, foreign_key: :closer_id

  has_one :message # last message

  has_many :messages, dependent: :delete_all
  has_and_belongs_to_many :rooms, class_name: Hotel::Room
  has_and_belongs_to_many :cities, class_name: Hotel::City

  accepts_nested_attributes_for :message
  accepts_nested_attributes_for :rooms

  scope :without_admin, conditions: { moderator_id: nil }
  scope :opened, conditions: { closed: false }
  scope :closed, conditions: { closed: true }
  scope :has_admin, lambda { |id| where moderator_id: id }
  scope :has_agency, lambda { |id| where agency_id: id }
  scope :has_camper, lambda { |id| where camper_id: id }
  scope :mine, lambda { where agency_id: User.current_user.id }
  scope :mine1, lambda { where camper_id: User.current_user.id }

  default_scope conditions: { closed: false }

  liquid_methods :messages, :rooms, :cities, :id, :agency, :moderator, :camper, :message, :closer

  def pull!
    update_attribute(:moderator_id, User.current_user.id)
    User.current_user.increment! :new_messages_count, messages.count
  end

  def open?
    closed == false and moderator_id == nil
  end

  def has_moderator?
    moderator_id != nil
  end

  def self.sort_column_names
    %w[created_at last_message_created_at id agency_id company_name]
  end

  before_destroy do |record|
    record.rooms.clear
    record.cities.clear
  end

  before_create do |record|
    record.city_ids = record.rooms.map { |i| i.hotel.city_id }.uniq
    if User.current_user.type == "User::Camper"
     record.camper_id = User.current_user.id
     record.company_name = record.camper.surname
    elsif User.current_user.type == "User::Agency"
     record.agency_id = User.current_user.id
     record.company_name = record.agency.profile.company_name
    end
  end

  after_create do |record|
    BasketItem.delete_all user_id: User.current_user.id

    moderator_ids = []

    rooms.each do |room|
      room.hotel.city.moderators.each do |moderator|
        moderator_ids << moderator.id
      end
    end

    moderator_ids.uniq.each do |id|
      moderator = User.find(id)

      if message = EmailTemplate.render('create_ticket', { 'ticket' => record }) and moderator.profile.notified
        TemplateMailer.delay.send_template moderator.email, message
      end
    end
  end

  after_save do |record|
    if record.closed
      if message = EmailTemplate.render('close_ticket', { 'ticket' => record })
        TemplateMailer.delay.send_template User.admin.email, message
      end
    end
  end

  after_destroy do |record|
    Ticket.delete_all "agency_id=#{record.id}"
    Ticket.delete_all "camper_id=#{record.id}"
  end

  self.per_page = 100
end
