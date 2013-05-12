class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :name

      t.has_attached_file :attach
      t.timestamps
    end
  end
end
