require 'spec_helper'

describe "user_hoteliers/show" do
  before(:each) do
    @hotelier = assign(:hotelier, stub_model(User::Hotelier))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
