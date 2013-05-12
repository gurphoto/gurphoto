class AddIsTouristToUser < ActiveRecord::Migration
  def change
    add_column :users, :is_tourist, :boolean
  end
end
