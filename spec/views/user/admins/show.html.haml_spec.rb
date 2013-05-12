require 'spec_helper'

describe "user_admins/show" do
  before(:each) do
    @admin = assign(:admin, stub_model(User::Admin))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
