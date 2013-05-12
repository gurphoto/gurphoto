class CreateHotelRoomImages < ActiveRecord::Migration
  def change
    create_table :hotel_room_images do |t|
      t.integer :hotel_id
      t.has_attached_file :attach
      t.string :description
    end
  end
end
