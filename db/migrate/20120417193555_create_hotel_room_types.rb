class CreateHotelRoomTypes < ActiveRecord::Migration
  def change
    create_table :hotel_room_types do |t|
      t.string :name
    end
  end
end
