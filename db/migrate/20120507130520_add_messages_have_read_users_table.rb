class AddMessagesHaveReadUsersTable < ActiveRecord::Migration
  def change
    create_table :messages_have_read_users, id: false do |t|
      t.integer :message_id
      t.integer :user_id
    end

    add_index :messages_have_read_users, [:message_id, :user_id], unique: true
  end
end
