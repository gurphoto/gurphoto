require "spec_helper"

describe Hotels::BankAttributesController do
  describe "routing" do

    it "routes to #index" do
      get("/hotels_bank_attributes").should route_to("hotels_bank_attributes#index")
    end

    it "routes to #new" do
      get("/hotels_bank_attributes/new").should route_to("hotels_bank_attributes#new")
    end

    it "routes to #show" do
      get("/hotels_bank_attributes/1").should route_to("hotels_bank_attributes#show", :id => "1")
    end

    it "routes to #edit" do
      get("/hotels_bank_attributes/1/edit").should route_to("hotels_bank_attributes#edit", :id => "1")
    end

    it "routes to #create" do
      post("/hotels_bank_attributes").should route_to("hotels_bank_attributes#create")
    end

    it "routes to #update" do
      put("/hotels_bank_attributes/1").should route_to("hotels_bank_attributes#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/hotels_bank_attributes/1").should route_to("hotels_bank_attributes#destroy", :id => "1")
    end

  end
end
