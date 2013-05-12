class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :phones
      t.string :skype
      t.string :icq
      t.string :company_name
      t.string :address
      t.string :agreement

      t.timestamps
    end
  end
end
