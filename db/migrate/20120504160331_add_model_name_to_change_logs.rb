class AddModelNameToChangeLogs < ActiveRecord::Migration
  def change
    add_column :change_logs, :model_name, :string
  end
end
