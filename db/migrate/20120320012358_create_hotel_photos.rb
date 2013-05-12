class CreateHotelPhotos < ActiveRecord::Migration
  def change
    create_table :hotel_photos do |t|
      t.integer :hotel_id
      t.string :description
      t.has_attached_file :image
    end
  end
end
