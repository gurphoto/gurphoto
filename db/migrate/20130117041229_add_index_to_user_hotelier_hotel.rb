class AddIndexToUserHotelierHotel < ActiveRecord::Migration
  def change
    add_index :user_hotelier_hotels, :user_id, :name => 'by_user'
    add_index :user_hotelier_hotels, :hotel_id, :name => 'by_hotel'
  end
end
