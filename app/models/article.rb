class Article < ActiveRecord::Base
  has_attached_file :image, :content_type => :image, :styles => { :medium => '300x160>', :thumb => '60x60>' }, default_url: '/assets/missing60x60.png'
  strip_attributes

  validates :title, :description, presence: true, length: { minimum: 5, maximum: 255 }
  attr_accessible :title, :description, :image, :content, :image_delete

  scope :recent, lambda { |count| limit(count) }
  default_scope order: 'created_at DESC'

  def image_delete
    @image_delete ||= '0'
  end

  def image_delete=(value)
    @image_delete = value
  end

  before_save do |record|
    record.image.clear if record.image_delete == "1"
  end

  self.per_page = 10
end
