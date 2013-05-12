class Hotel::Room::List::Value < ActiveRecord::Base
  attr_accessible :item_id, :list_id

  belongs_to :room
  belongs_to :list
  belongs_to :item

  validates :item_id, :list_id, presence: true
end
