require 'spec_helper'

describe "hotel_reviews/edit" do
  before(:each) do
    @review = assign(:review, stub_model(Hotel::Review))
  end

  it "renders the edit review form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => hotel_reviews_path(@review), :method => "post" do
    end
  end
end
