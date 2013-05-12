require 'spec_helper'

describe "tickets/show" do
  before(:each) do
    @ticket = assign(:ticket, stub_model(Ticket,
      :agency_id => 1,
      :admin_id => 2,
      :message_id => 3,
      :closed => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/false/)
  end
end
