class AddBookingDescriptionToHotels < ActiveRecord::Migration
  def change
    add_column :hotels, :booking_description, :string
  end
end
