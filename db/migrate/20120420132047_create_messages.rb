class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :user_id
      t.integer :ticket_id
      t.text :text
      t.boolean :edited

      t.timestamps
    end

    add_index :messages, :ticket_id
    add_index :messages, :user_id

    create_table :messages_users do |t|
      t.integer :user_id
      t.integer :message_id
    end
  end
end
