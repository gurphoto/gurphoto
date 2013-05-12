require "spec_helper"

describe Hotel::ReviewsController do
  describe "routing" do

    it "routes to #index" do
      get("/hotel_reviews").should route_to("hotel_reviews#index")
    end

    it "routes to #new" do
      get("/hotel_reviews/new").should route_to("hotel_reviews#new")
    end

    it "routes to #show" do
      get("/hotel_reviews/1").should route_to("hotel_reviews#show", :id => "1")
    end

    it "routes to #edit" do
      get("/hotel_reviews/1/edit").should route_to("hotel_reviews#edit", :id => "1")
    end

    it "routes to #create" do
      post("/hotel_reviews").should route_to("hotel_reviews#create")
    end

    it "routes to #update" do
      put("/hotel_reviews/1").should route_to("hotel_reviews#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/hotel_reviews/1").should route_to("hotel_reviews#destroy", :id => "1")
    end

  end
end
