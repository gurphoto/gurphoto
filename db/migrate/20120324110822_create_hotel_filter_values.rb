class CreateHotelFilterValues < ActiveRecord::Migration
  def change
    create_table :hotel_filter_values do |t|
      t.integer :filter_id
      t.integer :hotel_id
      t.integer :item_id
    end
  end
end
