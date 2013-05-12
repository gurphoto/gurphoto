require 'spec_helper'

describe "hotel_room_fields/new" do
  before(:each) do
    assign(:field, stub_model(Hotel::Room::Field).as_new_record)
  end

  it "renders new field form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => hotel_room_fields_path, :method => "post" do
    end
  end
end
