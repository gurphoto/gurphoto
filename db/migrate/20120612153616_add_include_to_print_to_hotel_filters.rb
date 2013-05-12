class AddIncludeToPrintToHotelFilters < ActiveRecord::Migration
  def change
    add_column :hotel_filters, :include_to_print, :boolean, default: false
  end
end
