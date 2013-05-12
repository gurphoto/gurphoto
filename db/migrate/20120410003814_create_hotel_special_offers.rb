class CreateHotelSpecialOffers < ActiveRecord::Migration
  def change
    create_table :hotel_special_offers do |t|
      t.integer :hotel_id
      t.timestamp :from
      t.timestamp :to
      t.string :description

      t.timestamps
    end
  end
end
