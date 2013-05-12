class CreateHotelReviews < ActiveRecord::Migration
  def change
    create_table :hotel_reviews do |t|
      t.string :name
      t.string :email
      t.string :ip
      t.text :text

      t.timestamps
    end
  end
end
