require 'spec_helper'

describe "tickets/index" do
  before(:each) do
    assign(:tickets, [
      stub_model(Ticket,
        :agency_id => 1,
        :admin_id => 2,
        :message_id => 3,
        :closed => false
      ),
      stub_model(Ticket,
        :agency_id => 1,
        :admin_id => 2,
        :message_id => 3,
        :closed => false
      )
    ])
  end

  it "renders a list of tickets" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
