class AddWayImage < ActiveRecord::Migration
  def change
    change_table :hotels do |t|
      t.has_attached_file :way
    end
  end
end
