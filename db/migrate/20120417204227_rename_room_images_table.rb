class RenameRoomImagesTable < ActiveRecord::Migration
  def change
    rename_table :hotel_room_images, :hotel_room_photos
  end
end
