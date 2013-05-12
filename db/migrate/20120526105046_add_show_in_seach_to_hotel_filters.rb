class AddShowInSeachToHotelFilters < ActiveRecord::Migration
  def change
    add_column :hotel_filters, :show_in_search, :boolean
  end
end
