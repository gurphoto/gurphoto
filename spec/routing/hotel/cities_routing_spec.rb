require "spec_helper"

describe Hotel::CitiesController do
  describe "routing" do

    it "routes to #index" do
      get("/hotel_cities").should route_to("hotel_cities#index")
    end

    it "routes to #new" do
      get("/hotel_cities/new").should route_to("hotel_cities#new")
    end

    it "routes to #show" do
      get("/hotel_cities/1").should route_to("hotel_cities#show", :id => "1")
    end

    it "routes to #edit" do
      get("/hotel_cities/1/edit").should route_to("hotel_cities#edit", :id => "1")
    end

    it "routes to #create" do
      post("/hotel_cities").should route_to("hotel_cities#create")
    end

    it "routes to #update" do
      put("/hotel_cities/1").should route_to("hotel_cities#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/hotel_cities/1").should route_to("hotel_cities#destroy", :id => "1")
    end

  end
end
