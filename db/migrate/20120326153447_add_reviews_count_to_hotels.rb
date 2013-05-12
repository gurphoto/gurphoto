class AddReviewsCountToHotels < ActiveRecord::Migration
  def change
    add_column :hotels, :reviews_count, :integer, default: 0

    Hotel.reset_column_information
    Hotel.all.each do |h|
      Hotel.update_counters h.id, :reviews_count => h.reviews.length
    end
  end
end
