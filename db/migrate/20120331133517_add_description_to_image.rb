class AddDescriptionToImage < ActiveRecord::Migration
  def change
    add_column :hotel_images, :description, :string
    rename_column :hotel_images, :name, :path
  end
end
