class CreateHotelRoomFields < ActiveRecord::Migration
  def change
    create_table :hotel_room_fields do |t|
      t.string :name
      t.string :default_value
    end
  end
end
