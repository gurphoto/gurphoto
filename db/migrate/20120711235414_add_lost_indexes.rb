class AddLostIndexes < ActiveRecord::Migration
  def up
    add_index :hotel_bank_attributes, :hotel_id
    add_index :hotel_filter_items, :filter_id
    add_index :hotel_filter_values, :filter_id
    add_index :hotel_filter_values, :hotel_id
    add_index :hotel_filter_values, :item_id
    add_index :hotel_images, :hotel_id
    #add_index :hotel_reviews, :hotel_id
    add_index :hotel_room_field_values, :field_id
  end

  def down
  end
end
