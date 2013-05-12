class AddImageToArticles < ActiveRecord::Migration
  def change
    change_table :articles do |t|
      t.has_attached_file :image
    end
  end
end

