require 'spec_helper'

describe "user_agencies/new" do
  before(:each) do
    assign(:agency, stub_model(User::Agency).as_new_record)
  end

  it "renders new agency form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => user_agencies_path, :method => "post" do
    end
  end
end
