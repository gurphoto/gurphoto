class AddChangeLogTable < ActiveRecord::Migration
  def change
    create_table :change_logs do |t|
      t.integer :version, null: false
      t.integer :record_id, limit: 30
      t.string :table_name, limit: 60
      t.string :attribute_name, limit: 60
      t.string :user, limit: 20
      t.string :action, limit: 6
      t.text :old_value
      t.text :new_value
      t.string :field_type, limit: 30
      t.timestamps
    end
  end
end
