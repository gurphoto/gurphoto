class AddAllCountToHotelRooms < ActiveRecord::Migration
  def change
    add_column :hotel_rooms, :all_count, :integer
  end
end
