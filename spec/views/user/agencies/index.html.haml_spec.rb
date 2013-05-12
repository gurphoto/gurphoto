require 'spec_helper'

describe "user_agencies/index" do
  before(:each) do
    assign(:user_agencies, [
      stub_model(User::Agency),
      stub_model(User::Agency)
    ])
  end

  it "renders a list of user_agencies" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
