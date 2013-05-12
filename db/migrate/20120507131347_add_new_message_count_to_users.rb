class AddNewMessageCountToUsers < ActiveRecord::Migration
  def change
    add_column :users, :new_messages_count, :integer, default: 0
  end
end
