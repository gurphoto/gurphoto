class CreateHotelRoomLists < ActiveRecord::Migration
  def change
    create_table :hotel_room_lists do |t|
      t.string :name
      t.integer :position

      t.timestamps
    end
  end
end
