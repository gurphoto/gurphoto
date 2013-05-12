class AddImageFieldsInPagesTable < ActiveRecord::Migration
  def up
    change_table :pages do |t|
      t.has_attached_file :image
    end
  end

  def down
    drop_attached_file :pages, :image
  end
end
