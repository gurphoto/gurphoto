class Hotel::SpecialOffer < ActiveRecord::Base
  belongs_to :hotel
  attr_accessible :description, :from, :hotel_id, :to, :title

  scope :active, where('hotel_special_offers.to >= now()')

  validates :title, :description, length: { minimum: 2, maximum: 255 }
end
