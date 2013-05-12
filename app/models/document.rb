class Document < ActiveRecord::Base
  has_attached_file :attach
  acts_as_list
  strip_attributes

  validates :name, presence: true, :length => { minimum: 5, maximum: 255 }
  validates :attach, :attachment_presence => true

  scope :recent, lambda { |count| limit(count) }
  default_scope order: 'position'

  attr_accessible :name, :attach, :description
  attr_accessible :position
end
