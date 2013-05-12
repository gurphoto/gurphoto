class ChangeDefaultValueFromSaveHotelQuery < ActiveRecord::Migration
  def up
    change_column :users, :save_hotel_search_query, :boolean, default: true

    User.all.each do |user|
      user.update_attributes save_hotel_search_query: true
    end
  end

  def down
  end
end
