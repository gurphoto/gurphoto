require 'spec_helper'

describe "user_agencies/edit" do
  before(:each) do
    @agency = assign(:agency, stub_model(User::Agency))
  end

  it "renders the edit agency form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => user_agencies_path(@agency), :method => "post" do
    end
  end
end
