class AddFieldsToRooms < ActiveRecord::Migration
  def change
    add_column :hotel_rooms, :seats, :string
    add_column :hotel_rooms, :area, :string
  end
end
