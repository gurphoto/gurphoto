class AddStreetIdToHotels < ActiveRecord::Migration
  def change
    add_column :hotels, :street_id, :integer
  end
end
