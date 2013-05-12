class AddPriceFieldsToToms < ActiveRecord::Migration
  def up
    change_table :hotel_rooms do |t|
      t.integer :price_summer_from
      t.integer :price_summer_to
      t.integer :price_high_season_from
      t.integer :price_high_season_to
      t.integer :price_winter_from
      t.integer :price_winter_to
    end
  end

  def down

    remove_column :hotel_rooms, :price_summer_from
    remove_column :hotel_rooms, :price_summer_to
    remove_column :hotel_rooms, :price_high_season_from
    remove_column :hotel_rooms, :price_high_season_to
    remove_column :hotel_rooms, :price_winter_from
    remove_column :hotel_rooms, :price_winter_to
  end
end
