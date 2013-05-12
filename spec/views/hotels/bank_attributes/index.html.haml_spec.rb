require 'spec_helper'

describe "hotels_bank_attributes/index" do
  before(:each) do
    assign(:hotels_bank_attributes, [
      stub_model(Hotels::BankAttribute,
        :name => "Name",
        :bik => "Bik",
        :corr_account => "Corr Account",
        :current_account => "Current Account"
      ),
      stub_model(Hotels::BankAttribute,
        :name => "Name",
        :bik => "Bik",
        :corr_account => "Corr Account",
        :current_account => "Current Account"
      )
    ])
  end

  it "renders a list of hotels_bank_attributes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Bik".to_s, :count => 2
    assert_select "tr>td", :text => "Corr Account".to_s, :count => 2
    assert_select "tr>td", :text => "Current Account".to_s, :count => 2
  end
end
