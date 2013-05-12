require 'spec_helper'

describe "hotel_cities/show" do
  before(:each) do
    @city = assign(:city, stub_model(Hotel::City,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
