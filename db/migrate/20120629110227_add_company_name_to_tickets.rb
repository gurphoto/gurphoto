class AddCompanyNameToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :company_name, :string

    Ticket.all.each do |t|
      t.update_attribute :company_name, t.agency.profile.company_name
    end
  end
end
