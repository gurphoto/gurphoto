class AddOnlySignedFieldToHotelRoomFields < ActiveRecord::Migration
  def change
    add_column :hotel_room_fields, :only_signed, :boolean
  end
end
