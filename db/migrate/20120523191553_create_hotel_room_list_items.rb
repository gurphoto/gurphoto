class CreateHotelRoomListItems < ActiveRecord::Migration
  def change
    create_table :hotel_room_list_items do |t|
      t.integer :list_id
      t.string :name

      t.timestamps
    end
  end
end
