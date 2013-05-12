class AddAgencyCommissionToHotels < ActiveRecord::Migration
  def change
    add_column :hotels, :agency_commission, :integer, default: 0
  end
end
