require 'spec_helper'

describe "user_admins/new" do
  before(:each) do
    assign(:admin, stub_model(User::Admin).as_new_record)
  end

  it "renders new admin form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => user_admins_path, :method => "post" do
    end
  end
end
