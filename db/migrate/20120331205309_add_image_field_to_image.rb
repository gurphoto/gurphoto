class AddImageFieldToImage < ActiveRecord::Migration
  def change
    change_table :hotel_images do |t|
      t.has_attached_file :image
    end

    remove_column :hotel_images, :path
  end
end
