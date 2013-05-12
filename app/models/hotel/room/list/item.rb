class Hotel::Room::List::Item < ActiveRecord::Base
  attr_accessible :name

  belongs_to :list

  validates :name, presence: true
end
