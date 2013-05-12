module ImageDeleteAttribute
  def image_delete
    @image_delete ||= "0"
  end

  def image_delete=(value)
    @image_delete = value
  end

  def self.included(base)
    base.after_save do |record|
      record.image.destroy if record.image_delete == "1"
    end
  end
end
