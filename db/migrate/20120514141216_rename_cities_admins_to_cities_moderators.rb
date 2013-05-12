class RenameCitiesAdminsToCitiesModerators < ActiveRecord::Migration
  def change
    rename_table :admins_cities, :cities_moderators
    rename_column :cities_moderators, :admin_id, :moderator_id
  end
end
