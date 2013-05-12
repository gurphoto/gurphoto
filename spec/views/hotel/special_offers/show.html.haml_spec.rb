require 'spec_helper'

describe "hotel_special_offers/show" do
  before(:each) do
    @special_offer = assign(:special_offer, stub_model(Hotel::SpecialOffer,
      :hotel_id => 1,
      :description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Description/)
  end
end
