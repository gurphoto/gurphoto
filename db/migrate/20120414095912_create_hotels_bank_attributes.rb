class CreateHotelsBankAttributes < ActiveRecord::Migration
  def change
    create_table :hotel_bank_attributes do |t|
      t.integer :hotel_id
      t.string :name
      t.string :bik
      t.string :corr_account
      t.string :current_account
    end

    remove_column :hotels, :bank
    remove_column :hotels, :bik
    remove_column :hotels, :current_account
    remove_column :hotels, :coordination_account
  end
end
