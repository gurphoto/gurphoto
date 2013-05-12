require 'spec_helper'

describe "hotel_room_lists/show" do
  before(:each) do
    @list = assign(:list, stub_model(Hotel::Room::List,
      :name => "Name",
      :position => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/1/)
  end
end
