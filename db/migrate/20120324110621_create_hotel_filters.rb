class CreateHotelFilters < ActiveRecord::Migration
  def change
    create_table :hotel_filters do |t|
      t.string :name
    end
  end
end
