# encoding: utf-8
class Hotel::Filter < ActiveRecord::Base
  has_many :items
  accepts_nested_attributes_for :items, allow_destroy: true
  validates :name, presence: true
  default_scope order: 'position'

  attr_accessible :name, :items_attributes, :show_in_search, :include_to_print
  attr_accessible :position

  validates :name, presence: true
  validates :name, length: { minimum: 2, maximum: 255 }

  acts_as_list
  strip_attributes

  after_destroy do |record|
    Item.delete_all "filter_id=#{record.id}"
    Value.delete_all "filter_id=#{record.id}"
  end
end
