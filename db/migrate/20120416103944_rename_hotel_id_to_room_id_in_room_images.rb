class RenameHotelIdToRoomIdInRoomImages < ActiveRecord::Migration
  def change
    rename_column :hotel_room_images, :hotel_id, :room_id
  end
end
