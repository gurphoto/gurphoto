class Hotel::Room::Photo < ActiveRecord::Base
  has_attached_file :attach, :styles => { :medium => '360x268>', :thumb => '160x120>' }

  belongs_to :room, validate: true

  attr_accessible :attach, :room_id, :description
end
