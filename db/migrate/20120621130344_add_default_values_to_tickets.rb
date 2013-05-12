class AddDefaultValuesToTickets < ActiveRecord::Migration
  def change
    change_column :tickets, :agency_new_messages_count, :integer, default: 0
    change_column :tickets, :admin_new_messages_count, :integer, default: 0
  end
end
