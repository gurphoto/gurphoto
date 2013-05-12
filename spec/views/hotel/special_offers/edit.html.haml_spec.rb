require 'spec_helper'

describe "hotel_special_offers/edit" do
  before(:each) do
    @special_offer = assign(:special_offer, stub_model(Hotel::SpecialOffer,
      :hotel_id => 1,
      :description => "MyString"
    ))
  end

  it "renders the edit special_offer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => hotel_special_offers_path(@special_offer), :method => "post" do
      assert_select "input#special_offer_hotel_id", :name => "special_offer[hotel_id]"
      assert_select "input#special_offer_description", :name => "special_offer[description]"
    end
  end
end
