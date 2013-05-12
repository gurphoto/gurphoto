class CreateHotelRoomFieldValues < ActiveRecord::Migration
  def change
    create_table :hotel_room_field_values do |t|
      t.integer :field_id
      t.integer :room_id
      t.string :value
    end
  end
end
