class User::HotelierHotel < ActiveRecord::Base
  belongs_to :user
  #belongs_to :hotels

  has_many :hotels

  strip_attributes

  #accepts_nested_attributes_for :rooms, allow_destroy: false
  accepts_nested_attributes_for :hotels
  #accepts_nested_attributes_for :user

  attr_accessible :hotels_attributes
  #attr_accessible :users_attributes
  attr_accessible :user_id, :hotel_id, :hotel_name

  liquid_methods :hotels
  #liquid_methods :user_id, :hotel_id, :hotel_name

end
