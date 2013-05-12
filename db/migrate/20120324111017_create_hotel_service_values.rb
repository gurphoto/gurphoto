class CreateHotelServiceValues < ActiveRecord::Migration
  def change
    create_table :hotel_service_values do |t|
      t.integer :service_id
      t.integer :hotel_id
      t.string :value

      t.timestamps
    end
  end
end
