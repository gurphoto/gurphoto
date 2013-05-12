class AddCounterCacheFieldsToHotels < ActiveRecord::Migration
  def change
    add_column :hotels, :rooms_count, :integer
    add_column :hotels, :images_count, :integer
    add_column :hotels, :all_rooms_count, :integer
    add_column :hotels, :special_offers_count, :integer
  end
end
