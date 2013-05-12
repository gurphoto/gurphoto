require 'spec_helper'

describe "messages/new" do
  before(:each) do
    assign(:message, stub_model(Message,
      :user_id => 1,
      :ticket_id => 1,
      :text => "MyText",
      :edited => false
    ).as_new_record)
  end

  it "renders new message form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => messages_path, :method => "post" do
      assert_select "input#message_user_id", :name => "message[user_id]"
      assert_select "input#message_ticket_id", :name => "message[ticket_id]"
      assert_select "textarea#message_text", :name => "message[text]"
      assert_select "input#message_edited", :name => "message[edited]"
    end
  end
end
