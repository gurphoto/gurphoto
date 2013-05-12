require 'spec_helper'

describe "hotel_room_lists/index" do
  before(:each) do
    assign(:hotel_room_lists, [
      stub_model(Hotel::Room::List,
        :name => "Name",
        :position => 1
      ),
      stub_model(Hotel::Room::List,
        :name => "Name",
        :position => 1
      )
    ])
  end

  it "renders a list of hotel_room_lists" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
