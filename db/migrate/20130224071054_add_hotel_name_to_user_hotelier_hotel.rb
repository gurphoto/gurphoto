class AddHotelNameToUserHotelierHotel < ActiveRecord::Migration
  def change
    add_column :user_hotelier_hotels, :hotel_name, :string
  end
end
