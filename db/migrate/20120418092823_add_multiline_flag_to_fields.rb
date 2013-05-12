class AddMultilineFlagToFields < ActiveRecord::Migration
  def change
    add_column :hotel_room_fields, :multiline, :boolean
  end
end
