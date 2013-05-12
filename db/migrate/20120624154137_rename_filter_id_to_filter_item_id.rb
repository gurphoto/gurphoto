class RenameFilterIdToFilterItemId < ActiveRecord::Migration
  def change
    rename_column :hotel_services, :filter_id, :filter_item_id
  end
end
