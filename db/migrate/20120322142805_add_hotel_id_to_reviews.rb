class AddHotelIdToReviews < ActiveRecord::Migration
  def change
    add_column :hotel_reviews, :hotel_id, :integer
    add_index :hotel_reviews, :hotel_id
  end
end
