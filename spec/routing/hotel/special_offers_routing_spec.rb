require "spec_helper"

describe Hotel::SpecialOffersController do
  describe "routing" do

    it "routes to #index" do
      get("/hotel_special_offers").should route_to("hotel_special_offers#index")
    end

    it "routes to #new" do
      get("/hotel_special_offers/new").should route_to("hotel_special_offers#new")
    end

    it "routes to #show" do
      get("/hotel_special_offers/1").should route_to("hotel_special_offers#show", :id => "1")
    end

    it "routes to #edit" do
      get("/hotel_special_offers/1/edit").should route_to("hotel_special_offers#edit", :id => "1")
    end

    it "routes to #create" do
      post("/hotel_special_offers").should route_to("hotel_special_offers#create")
    end

    it "routes to #update" do
      put("/hotel_special_offers/1").should route_to("hotel_special_offers#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/hotel_special_offers/1").should route_to("hotel_special_offers#destroy", :id => "1")
    end

  end
end
