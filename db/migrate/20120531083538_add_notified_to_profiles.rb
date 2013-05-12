class AddNotifiedToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :notified, :boolean, default: true
  end
end
