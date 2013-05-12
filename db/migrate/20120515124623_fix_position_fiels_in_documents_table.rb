class FixPositionFielsInDocumentsTable < ActiveRecord::Migration
  def up
    Document.all.each_with_index do |resource, i|
      resource.update_attribute :position, i
    end
  end

  def down
  end
end
