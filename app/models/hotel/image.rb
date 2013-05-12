class Hotel::Image < ActiveRecord::Base
  has_attached_file :attach, :styles => { :medium => '360x268>', :thumb => '160x120>' }
  strip_attributes

  belongs_to :hotel, counter_cache: true
  attr_accessible :hotel_id, :attach, :description

  validates :description, length: { maximum: 255 }
end
