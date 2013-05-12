require 'spec_helper'

describe "tickets/new" do
  before(:each) do
    assign(:ticket, stub_model(Ticket,
      :agency_id => 1,
      :admin_id => 1,
      :message_id => 1,
      :closed => false
    ).as_new_record)
  end

  it "renders new ticket form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => tickets_path, :method => "post" do
      assert_select "input#ticket_agency_id", :name => "ticket[agency_id]"
      assert_select "input#ticket_admin_id", :name => "ticket[admin_id]"
      assert_select "input#ticket_message_id", :name => "ticket[message_id]"
      assert_select "input#ticket_closed", :name => "ticket[closed]"
    end
  end
end
