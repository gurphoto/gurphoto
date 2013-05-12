class AddIsPartnerFieldToUsers < ActiveRecord::Migration
  def change
    add_column :users, :is_partner, :boolean
  end
end
