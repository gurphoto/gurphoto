class AddMapCoordsToHotels < ActiveRecord::Migration
  def change
    add_column :hotels, :map_latitude, :float
    add_column :hotels, :map_longitude, :float
  end
end
