class AddIndexToTicket < ActiveRecord::Migration
  def change
    add_index :tickets, :camper_id, :name => 'index_tickets_on_camper_id'
  end
end
