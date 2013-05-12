require 'spec_helper'

describe "Hotel::Cities" do
  describe "GET /hotel_cities" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get hotel_cities_path
      response.status.should be(200)
    end
  end
end
