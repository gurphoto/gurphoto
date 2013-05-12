require 'spec_helper'

describe "user_agencies/show" do
  before(:each) do
    @agency = assign(:agency, stub_model(User::Agency))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
