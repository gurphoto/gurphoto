class CreateHotelStreets < ActiveRecord::Migration
  def change
    create_table :hotel_streets do |t|
      t.string :name
    end

    remove_column :hotels, :street
  end
end
