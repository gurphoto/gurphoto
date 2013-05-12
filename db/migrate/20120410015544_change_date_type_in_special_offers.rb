class ChangeDateTypeInSpecialOffers < ActiveRecord::Migration
  def change
    change_column :hotel_special_offers, :from, :date
    change_column :hotel_special_offers, :to, :date
  end
end
