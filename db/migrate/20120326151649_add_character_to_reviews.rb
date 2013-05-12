class AddCharacterToReviews < ActiveRecord::Migration
  def change
    add_column :hotel_reviews, :character, :integer
  end
end
