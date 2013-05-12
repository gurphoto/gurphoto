class CreateHotelRoomListValues < ActiveRecord::Migration
  def change
    create_table :hotel_room_list_values do |t|
      t.integer :room_id
      t.integer :list_id
      t.integer :item_id

      t.timestamps
    end
  end
end
