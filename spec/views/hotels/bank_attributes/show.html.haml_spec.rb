require 'spec_helper'

describe "hotels_bank_attributes/show" do
  before(:each) do
    @bank_attribute = assign(:bank_attribute, stub_model(Hotels::BankAttribute,
      :name => "Name",
      :bik => "Bik",
      :corr_account => "Corr Account",
      :current_account => "Current Account"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Bik/)
    rendered.should match(/Corr Account/)
    rendered.should match(/Current Account/)
  end
end
