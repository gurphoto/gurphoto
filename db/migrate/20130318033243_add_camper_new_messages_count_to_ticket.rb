class AddCamperNewMessagesCountToTicket < ActiveRecord::Migration
  def change
    add_column :tickets, :camper_new_messages_count, :integer, default: 0
  end
end
