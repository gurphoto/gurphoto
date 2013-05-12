require 'spec_helper'

describe "hotels_bank_attributes/new" do
  before(:each) do
    assign(:bank_attribute, stub_model(Hotels::BankAttribute,
      :name => "MyString",
      :bik => "MyString",
      :corr_account => "MyString",
      :current_account => "MyString"
    ).as_new_record)
  end

  it "renders new bank_attribute form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => hotels_bank_attributes_path, :method => "post" do
      assert_select "input#bank_attribute_name", :name => "bank_attribute[name]"
      assert_select "input#bank_attribute_bik", :name => "bank_attribute[bik]"
      assert_select "input#bank_attribute_corr_account", :name => "bank_attribute[corr_account]"
      assert_select "input#bank_attribute_current_account", :name => "bank_attribute[current_account]"
    end
  end
end
