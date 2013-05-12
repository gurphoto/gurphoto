class RenameAdminIdToModeratorIdInTickets < ActiveRecord::Migration
  def change
    rename_column :tickets, :admin_id, :moderator_id
  end
end
