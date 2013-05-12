class AddTypeIdToRooms < ActiveRecord::Migration
  def change
    add_column :hotel_rooms, :type_id, :integer
    add_index :hotel_rooms, :type_id
  end
end
