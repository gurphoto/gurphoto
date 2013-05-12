class User < ActiveRecord::Base
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable, :timeoutable, :encryptable

  has_and_belongs_to_many :rooms, class_name: Hotel::Room
  has_many :basket_items
  has_one :profile
  has_many :hotelier_hotels, dependent: :delete_all

  strip_attributes

  accepts_nested_attributes_for :profile, update_only: true
  accepts_nested_attributes_for :hotelier_hotels, allow_destroy: true

  attr_accessible :email, :password, :password_confirmation, :remember_me, :profile_attributes, :is_partner, :is_hotelier, :is_tourist
  attr_accessible :email, :password
  attr_accessible :save_hotel_search_query
  attr_accessible :hotel_search_query
  attr_accessible :hotelier_hotels_attributes

  liquid_methods :email, :profile, :admin?, :moderator?, :agency?, :hotelier?, :camper?, :hotelier_hotels

  def self.admin
    User.find_by_id 1
  end

  #TODO: remove this method
  def admin?
    type == nil || type == 'User::Moderator'
  end

  def super_admin?
    type == nil
  end

  def moderator?
    type == 'User::Moderator'
  end

  def agency?
    type == 'User::Agency'
  end

  def hotelier?
    type == 'User::Hotelier'
  end

  def camper?
    type == 'User::Camper'
  end

  def profile
    super || build_profile
  end

  def hotelier_hotel
   super || build_hotelier_hotel
  end

  def human_type
    I18n.t (type || 'User::Super').underscore
  end

  def self.current_user
    Thread.current[:user]
  end

  def self.current_user=(user)
    Thread.current[:user] = user
  end

  before_destroy do |record|
    record.profile.delete
  end
end
