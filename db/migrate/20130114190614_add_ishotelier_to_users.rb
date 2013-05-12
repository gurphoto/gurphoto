class AddIshotelierToUsers < ActiveRecord::Migration
  def change
    add_column :users, :is_hotelier, :boolean
  end
end
