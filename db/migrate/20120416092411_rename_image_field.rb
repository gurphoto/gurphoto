class RenameImageField < ActiveRecord::Migration
  def change
    rename_column :hotel_images, :image_file_name, :attach_file_name
    rename_column :hotel_images, :image_content_type, :attach_content_type
    rename_column :hotel_images, :image_file_size, :attach_file_size
    rename_column :hotel_images, :image_updated_at, :attach_updated_at
  end
end
