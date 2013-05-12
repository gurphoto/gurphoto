class FixProfileTable < ActiveRecord::Migration
  def change
    rename_column :profiles, :agency_id, :user_id
  end
end
