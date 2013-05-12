require 'spec_helper'

describe "hotel_reviews/show" do
  before(:each) do
    @review = assign(:review, stub_model(Hotel::Review))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
