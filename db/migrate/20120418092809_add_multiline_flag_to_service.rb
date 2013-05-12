class AddMultilineFlagToService < ActiveRecord::Migration
  def change
    add_column :hotel_services, :multiline, :boolean
  end
end
