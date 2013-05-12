class AddDefaultFieldToServices < ActiveRecord::Migration
  def change
    add_column :hotel_services, :default, :boolean
  end
end
