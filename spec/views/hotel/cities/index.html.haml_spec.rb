require 'spec_helper'

describe "hotel_cities/index" do
  before(:each) do
    assign(:hotel_cities, [
      stub_model(Hotel::City,
        :name => "Name"
      ),
      stub_model(Hotel::City,
        :name => "Name"
      )
    ])
  end

  it "renders a list of hotel_cities" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
