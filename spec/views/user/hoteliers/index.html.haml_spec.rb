require 'spec_helper'

describe "user_hoteliers/index" do
  before(:each) do
    assign(:user_hoteliers, [
        stub_model(User::Hotelier),
        stub_model(User::Hotelier)
    ])
  end

  it "renders a list of user_hoteliers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
