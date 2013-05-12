class AddFilterIdToHotelServices < ActiveRecord::Migration
  def change
    add_column :hotel_services, :filter_id, :integer
  end
end
