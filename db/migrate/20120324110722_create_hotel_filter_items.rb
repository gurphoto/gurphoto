class CreateHotelFilterItems < ActiveRecord::Migration
  def change
    create_table :hotel_filter_items do |t|
      t.integer :filter_id
      t.string :name
    end
  end
end
