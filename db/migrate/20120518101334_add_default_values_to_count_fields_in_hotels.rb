class AddDefaultValuesToCountFieldsInHotels < ActiveRecord::Migration
  def change
    change_column_default :hotels, :rooms_count, 0
    change_column_default :hotels, :images_count, 0
    change_column_default :hotels, :all_rooms_count, 0
    change_column_default :hotels, :special_offers_count, 0
    change_column_default :hotels, :min_price_winter, 0
    change_column_default :hotels, :min_price_summer, 0
    change_column_default :hotels, :agency_commission, 0
    change_column_default :hotels, :min_age_children, 0
    change_column_default :hotels, :reviews_count, 0

    Hotel.all.each do |resource|
      %w[rooms_count images_count all_rooms_count special_offers_count min_price_winter min_price_summer agency_commission min_age_children reviews_count].each do |name|
        unless resource.read_attribute name
          resource[name] = 0
        end
      end

      resource.save
    end
  end
end
