require 'spec_helper'

describe "hotel_room_fields/show" do
  before(:each) do
    @field = assign(:field, stub_model(Hotel::Room::Field))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
