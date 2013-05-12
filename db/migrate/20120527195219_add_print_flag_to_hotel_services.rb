class AddPrintFlagToHotelServices < ActiveRecord::Migration
  def change
    add_column :hotel_services, :include_to_print, :boolean
  end
end
