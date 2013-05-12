class ChangeEmailTemplate < ActiveRecord::Migration
  def change
    change_column :email_templates, :body, :text
  end
end
