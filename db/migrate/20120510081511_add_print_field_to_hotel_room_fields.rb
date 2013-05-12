class AddPrintFieldToHotelRoomFields < ActiveRecord::Migration
  def change
    add_column :hotel_room_fields, :include_to_print, :boolean
  end
end
