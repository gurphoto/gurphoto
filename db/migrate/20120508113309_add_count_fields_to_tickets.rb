class AddCountFieldsToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :admin_new_messages_count, :integer, default: 0
    add_column :tickets, :agency_new_messages_count, :integer, default: 0
  end
end
