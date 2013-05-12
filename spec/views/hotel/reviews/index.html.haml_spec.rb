require 'spec_helper'

describe "hotel_reviews/index" do
  before(:each) do
    assign(:hotel_reviews, [
      stub_model(Hotel::Review),
      stub_model(Hotel::Review)
    ])
  end

  it "renders a list of hotel_reviews" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
