class Hotel::Room::List < ActiveRecord::Base
  attr_accessible :name, :items_attributes
  attr_accessible :position

  has_many :items

  accepts_nested_attributes_for :items, allow_destroy: true

  validates :name, presence: true

  default_scope order: 'position'

  acts_as_list

  after_destroy do |record|
    Item.delete_all "list_id=#{record.id}"
    Value.delete_all "list_id=#{record.id}"
  end
end
