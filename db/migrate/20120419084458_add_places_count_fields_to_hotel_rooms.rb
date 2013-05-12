class AddPlacesCountFieldsToHotelRooms < ActiveRecord::Migration
  def change
    add_column :hotel_rooms, :places_count, :integer
    add_column :hotel_rooms, :additional_places_count, :integer
  end
end
