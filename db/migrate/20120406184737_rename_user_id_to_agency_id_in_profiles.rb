class RenameUserIdToAgencyIdInProfiles < ActiveRecord::Migration
  def change
    rename_column :profiles, :user_id, :agency_id
  end
end
