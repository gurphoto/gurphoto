class CreateHotelClassifications < ActiveRecord::Migration
  def change
    create_table :hotel_classifications do |t|
      t.string :name
    end
  end
end
