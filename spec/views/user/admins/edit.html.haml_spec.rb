require 'spec_helper'

describe "user_admins/edit" do
  before(:each) do
    @admin = assign(:admin, stub_model(User::Admin))
  end

  it "renders the edit admin form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => user_admins_path(@admin), :method => "post" do
    end
  end
end
