class RenameCharacterColumnIn < ActiveRecord::Migration
  def change
    rename_column :hotel_reviews, :character, :character_id
  end
end
