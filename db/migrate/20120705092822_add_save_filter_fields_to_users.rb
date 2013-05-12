class AddSaveFilterFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :save_hotel_search_query, :boolean
    add_column :users, :hotel_search_query, :text
  end
end
