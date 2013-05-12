class CreateHotelRoomsTypeTypes < ActiveRecord::Migration
  def change
    create_table :hotel_rooms_type_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
