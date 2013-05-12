class CreateHotelAdditionalServices < ActiveRecord::Migration
  def change
    create_table :hotel_additional_services do |t|
      t.string :name
    end
  end
end
