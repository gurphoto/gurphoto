class AddOnlyModeratorToHotelServices < ActiveRecord::Migration
  def change
    add_column :hotel_services, :only_moderator, :boolean
  end
end
