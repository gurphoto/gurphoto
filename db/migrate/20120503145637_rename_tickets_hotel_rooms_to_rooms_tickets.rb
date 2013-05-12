class RenameTicketsHotelRoomsToRoomsTickets < ActiveRecord::Migration
  def change
    rename_table :tickets_hotel_rooms, :rooms_tickets
  end
end
