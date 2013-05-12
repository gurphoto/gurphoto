class AddTitleToHotelSpecialOffers < ActiveRecord::Migration
  def change
    add_column :hotel_special_offers, :title, :string
  end
end
