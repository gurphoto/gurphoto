require 'spec_helper'

describe "user_hoteliers/edit" do
  before(:each) do
    @hotelier = assign(:hotelier, stub_model(User::Hotelier))
  end

  it "renders the edit hotelier form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => user_hoteliers_path(@hotelier), :method => "post" do
    end
  end
end
