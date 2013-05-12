require 'spec_helper'

describe "user_hoteliers/new" do
  before(:each) do
    assign(:hotelier, stub_model(User::Hotelier).as_new_record)
  end

  it "renders new hotelier form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => user_hoteliers_path, :method => "post" do
    end
  end
end
