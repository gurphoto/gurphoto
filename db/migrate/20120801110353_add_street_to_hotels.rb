class AddStreetToHotels < ActiveRecord::Migration
  def change
    add_column :hotels, :street, :string

    Hotel.all.each do |resource|
      begin
        resource.street = Hotel::Street.find(resource.street_id).name
        resource.save validate: false
      rescue
      end
    end
  end
end
