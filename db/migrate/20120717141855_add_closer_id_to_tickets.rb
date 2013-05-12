class AddCloserIdToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :closer_id, :integer
  end
end
