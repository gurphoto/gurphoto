require 'spec_helper'

describe "hotel_room_fields/index" do
  before(:each) do
    assign(:hotel_room_fields, [
      stub_model(Hotel::Room::Field),
      stub_model(Hotel::Room::Field)
    ])
  end

  it "renders a list of hotel_room_fields" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
