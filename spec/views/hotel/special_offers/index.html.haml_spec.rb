require 'spec_helper'

describe "hotel_special_offers/index" do
  before(:each) do
    assign(:hotel_special_offers, [
      stub_model(Hotel::SpecialOffer,
        :hotel_id => 1,
        :description => "Description"
      ),
      stub_model(Hotel::SpecialOffer,
        :hotel_id => 1,
        :description => "Description"
      )
    ])
  end

  it "renders a list of hotel_special_offers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
