class CreateHotels < ActiveRecord::Migration
  def change
    create_table :hotels do |t|
      t.string :name
      t.integer :classification_id
      t.integer :type_id
      t.text :description

      t.timestamps
    end
  end
end
