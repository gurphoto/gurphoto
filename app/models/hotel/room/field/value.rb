# encoding: utf-8

class Hotel::Room::Field::Value < ActiveRecord::Base
  attr_accessible :field_id, :value

  belongs_to :field
  belongs_to :room

  validates :value, length: { maximum: 255 }
end
