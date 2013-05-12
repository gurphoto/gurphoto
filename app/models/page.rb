class Page < ActiveRecord::Base
  has_attached_file :image, content_type: :image, styles: { :medium => '320x200>' }
  attr_accessible :image, :title, :alias, :content

  def image_delete
    @image_delete ||= '0'
  end

  def image_delete=(value)
    @image_delete = value
  end

  before_save do |record|
    record.image.clear if record.image_delete == "1"
  end
end
