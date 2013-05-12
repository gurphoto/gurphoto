class CreateUserHotelierHotels < ActiveRecord::Migration
  def change
    create_table :user_hotelier_hotels do |t|
      t.integer :user_id
      t.integer :hotel_id

      t.timestamps
    end
  end
end
