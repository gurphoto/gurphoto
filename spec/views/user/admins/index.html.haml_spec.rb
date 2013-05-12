require 'spec_helper'

describe "user_admins/index" do
  before(:each) do
    assign(:user_admins, [
      stub_model(User::Admin),
      stub_model(User::Admin)
    ])
  end

  it "renders a list of user_admins" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
