class RemoveSeatsFromHotelRooms < ActiveRecord::Migration
  def change
    remove_column :hotel_rooms, :seats
  end
end
