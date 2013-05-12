class AddValidityToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :validity, :date
  end
end
