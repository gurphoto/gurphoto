require 'spec_helper'

describe "hotel_rooms/edit" do
  before(:each) do
    @room = assign(:room, stub_model(Hotel::Room,
      :hotel_id => 1,
      :name => "MyString"
    ))
  end

  it "renders the edit room form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => hotel_rooms_path(@room), :method => "post" do
      assert_select "input#room_hotel_id", :name => "room[hotel_id]"
      assert_select "input#room_name", :name => "room[name]"
    end
  end
end
