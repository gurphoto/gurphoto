class AddBackendsTable < ActiveRecord::Migration
  def change
    create_table :rooms_users, id: false do |t|
      t.integer :user_id
      t.integer :room_id
    end
  end
end
