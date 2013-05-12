class ChangeAddressInHotel < ActiveRecord::Migration
  def change
    rename_column :hotels, :address, :street
    add_column :hotels, :street_number, :string
  end
end
