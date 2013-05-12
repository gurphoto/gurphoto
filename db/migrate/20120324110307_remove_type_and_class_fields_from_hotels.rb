class RemoveTypeAndClassFieldsFromHotels < ActiveRecord::Migration
  def up
    remove_column :hotels, :type_id
    remove_column :hotels, :classification_id
  end

  def down
  end
end
