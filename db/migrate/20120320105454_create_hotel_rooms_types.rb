class CreateHotelRoomsTypes < ActiveRecord::Migration
  def change
    create_table :hotel_rooms_types do |t|
      t.string :name
      t.integer :room_size
      t.integer :seats_count
      t.string :wc
      t.string :balcony
      t.string :string
      t.integer :_count
      t.string :description
      t.boolean :television
      t.string :change_linen
      t.string :mini_bar
      t.string :safe
      t.boolean :cleaning
      t.integer :summmer_price_from
      t.integer :summer_price_to
      t.integer :winter_price_from
      t.integer :winter_price_to
      t.integer :high_price_from
      t.integer :high_price_to
      t.integer :additional_places_count
      t.text :price_list
      t.boolean :special_offer
      t.timestamp :offer_start
      t.timestamp :offer_end

      t.timestamps
    end
  end
end
