class Hotel::Filter::Value < ActiveRecord::Base
  belongs_to :item
  belongs_to :filter

  attr_accessible :filter_id, :hotel_id, :name, :item_id
end
