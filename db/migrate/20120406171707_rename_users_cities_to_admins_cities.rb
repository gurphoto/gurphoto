class RenameUsersCitiesToAdminsCities < ActiveRecord::Migration
  def change
    rename_table :cities_users, :admins_cities
    rename_column :admins_cities, :user_id, :admin_id
  end
end
