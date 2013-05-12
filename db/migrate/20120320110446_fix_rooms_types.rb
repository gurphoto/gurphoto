class FixRoomsTypes < ActiveRecord::Migration
  def change
    remove_column :hotel_rooms_types, :_count
    remove_column :hotel_rooms_types, :string

    add_column :hotel_rooms_types, :type_id, :integer
    add_index :hotel_rooms_types, :type_id
  end
end
