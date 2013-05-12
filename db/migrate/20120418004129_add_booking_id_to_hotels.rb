class AddBookingIdToHotels < ActiveRecord::Migration
  def change
    add_column :hotels, :booking_id, :integer
  end
end
