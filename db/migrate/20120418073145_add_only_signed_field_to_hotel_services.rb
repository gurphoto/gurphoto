class AddOnlySignedFieldToHotelServices < ActiveRecord::Migration
  def change
    add_column :hotel_services, :only_signed, :boolean
  end
end
