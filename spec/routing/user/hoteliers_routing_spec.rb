require "spec_helper"

describe User::HoteliersController do
  describe "routing" do

    it "routes to #index" do
      get("/user_hoteliers").should route_to("user_hoteliers#index")
    end

    it "routes to #new" do
      get("/user_hoteliers/new").should route_to("user_hoteliers#new")
    end

    it "routes to #show" do
      get("/user_hoteliers/1").should route_to("user_hoteliers#show", :id => "1")
    end

    it "routes to #edit" do
      get("/user_hoteliers/1/edit").should route_to("user_hoteliers#edit", :id => "1")
    end

    it "routes to #create" do
      post("/user_hoteliers").should route_to("user_hoteliers#create")
    end

    it "routes to #update" do
      put("/user_hoteliers/1").should route_to("user_hoteliers#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/user_hoteliers/1").should route_to("user_hoteliers#destroy", :id => "1")
    end

  end
end
