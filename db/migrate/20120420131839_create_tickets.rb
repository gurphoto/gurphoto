class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.integer :agency_id
      t.integer :admin_id
      t.integer :message_id
      t.boolean :closed
      t.integer :messages_count
      
      t.timestamps
    end

    add_index :tickets, :agency_id
    add_index :tickets, :admin_id
    add_index :tickets, :message_id

    create_table :tickets_hotel_rooms, id: false do |t|
      t.integer :ticket_id
      t.integer :room_id
    end

    create_table :tickets_hotel_cities, id: false do |t|
      t.integer :ticket_id
      t.integer :city_id
    end
  end
end
