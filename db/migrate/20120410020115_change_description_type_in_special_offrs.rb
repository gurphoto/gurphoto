class ChangeDescriptionTypeInSpecialOffrs < ActiveRecord::Migration
  def change
    change_column :hotel_special_offers, :description, :text
  end
end
