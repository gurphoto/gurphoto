require 'spec_helper'

describe "hotel_room_lists/edit" do
  before(:each) do
    @list = assign(:list, stub_model(Hotel::Room::List,
      :name => "MyString",
      :position => 1
    ))
  end

  it "renders the edit list form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => hotel_room_lists_path(@list), :method => "post" do
      assert_select "input#list_name", :name => "list[name]"
      assert_select "input#list_position", :name => "list[position]"
    end
  end
end
