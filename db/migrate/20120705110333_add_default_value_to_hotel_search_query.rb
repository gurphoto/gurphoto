class AddDefaultValueToHotelSearchQuery < ActiveRecord::Migration
  def up
    change_column :users, :hotel_search_query, :text, default: ''
    change_column :users, :save_hotel_search_query, :boolean, default: false
  end

  def down
  end
end
