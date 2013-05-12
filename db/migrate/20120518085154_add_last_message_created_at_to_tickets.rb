class AddLastMessageCreatedAtToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :last_message_created_at, :datetime
  end
end
