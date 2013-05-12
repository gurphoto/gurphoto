class AddFieldsToHotels < ActiveRecord::Migration
  def change
    add_column :hotels, :phone, :string
    add_column :hotels, :email, :string
    add_column :hotels, :site, :string
    add_column :hotels, :route_description, :text
    add_column :hotels, :bank, :string
    add_column :hotels, :bik, :string
    add_column :hotels, :current_account, :string
    add_column :hotels, :coordination_account, :string
    add_column :hotels, :iin, :string
    add_column :hotels, :kpp, :string
    add_column :hotels, :ogrn, :string
    add_column :hotels, :legal_address, :string
    add_column :hotels, :post_address, :string
  end
end
