require 'spec_helper'

describe "Hotel::SpecialOffers" do
  describe "GET /hotel_special_offers" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get hotel_special_offers_path
      response.status.should be(200)
    end
  end
end
