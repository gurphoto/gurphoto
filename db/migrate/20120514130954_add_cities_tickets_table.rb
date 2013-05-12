class AddCitiesTicketsTable < ActiveRecord::Migration
  def change
    create_table :cities_tickets, id: false do |t|
      t.integer :ticket_id
      t.integer :city_id
    end

    add_index :cities_tickets, [:ticket_id, :city_id], unique: true
  end
end
