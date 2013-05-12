require 'spec_helper'

describe "hotel_rooms/new" do
  before(:each) do
    assign(:room, stub_model(Hotel::Room,
      :hotel_id => 1,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new room form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => hotel_rooms_path, :method => "post" do
      assert_select "input#room_hotel_id", :name => "room[hotel_id]"
      assert_select "input#room_name", :name => "room[name]"
    end
  end
end
