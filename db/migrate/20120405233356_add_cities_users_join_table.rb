class AddCitiesUsersJoinTable < ActiveRecord::Migration
  def change
    create_table :cities_users, id: false do |t|
      t.integer :user_id
      t.integer :city_id
    end
  end
end
