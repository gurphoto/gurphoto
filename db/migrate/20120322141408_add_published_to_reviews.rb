class AddPublishedToReviews < ActiveRecord::Migration
  def change
    add_column :hotel_reviews, :published, :boolean
  end
end
