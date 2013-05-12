class AddPublishedToHotels < ActiveRecord::Migration
  def change
    add_column :hotels, :published, :boolean
  end
end
