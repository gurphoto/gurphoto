class AddAddressToHotels < ActiveRecord::Migration
  def change
    add_column :hotels, :address, :string
  end
end
