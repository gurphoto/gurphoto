class AddLogoFieldsToAgencies < ActiveRecord::Migration
  def up
    change_table :profiles do |t|
      t.has_attached_file :logo
    end
  end

  def down
    drop_attached_file :profiles, :logo
  end
end
