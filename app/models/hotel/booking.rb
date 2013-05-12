class Hotel::Booking < ActiveRecord::Base
  attr_accessible :name
  strip_attributes
end
