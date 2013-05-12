class AddCamperIdToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :camper_id, :integer
  end
end
