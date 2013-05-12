class AddSomeFieldsToHotels < ActiveRecord::Migration
  def change
    add_column :hotels, :min_age_children, :integer
    add_column :hotels, :adjacent_territory, :text
    add_column :hotels, :min_price_winter, :integer
    add_column :hotels, :min_price_summer, :integer
    add_column :hotels, :checkout_time, :string
    add_column :hotels, :documents, :string
  end
end
