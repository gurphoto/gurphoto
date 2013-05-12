class AddDefaultPublishedToHotelReviews < ActiveRecord::Migration
  def change
    change_column :hotel_reviews, :published, :boolean, default: false
  end
end
