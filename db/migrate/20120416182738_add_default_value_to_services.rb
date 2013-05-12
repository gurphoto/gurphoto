class AddDefaultValueToServices < ActiveRecord::Migration
  def change
    add_column :hotel_services, :default_value, :string
  end
end
