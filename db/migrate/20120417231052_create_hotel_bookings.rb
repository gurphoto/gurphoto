class CreateHotelBookings < ActiveRecord::Migration
  def change
    create_table :hotel_bookings do |t|
      t.string :name

      t.timestamps
    end
  end
end
