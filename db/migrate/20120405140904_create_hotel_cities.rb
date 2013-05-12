class CreateHotelCities < ActiveRecord::Migration
  def change
    create_table :hotel_cities do |t|
      t.string :name

      t.timestamps
    end
  end
end
