class AddPositionFieldsInTables < ActiveRecord::Migration
  def up
    add_column :hotel_cities, :position, :integer
    add_column :hotel_filters, :position, :integer
    add_column :hotel_services, :position, :integer
    add_column :hotel_room_fields, :position, :integer

    [Hotel::City, Hotel::Filter, Hotel::Service, Hotel::Room::Field].each do |model|
      model.all.each_with_index do |resource, i|
        resource.update_attribute :position, i + 1
      end
    end
  end

  def down
    remove_column :hotel_cities, :position
    remove_column :hotel_filters, :position
    remove_column :hotel_services, :position
    remove_column :hotel_room_fields, :position
  end
end
