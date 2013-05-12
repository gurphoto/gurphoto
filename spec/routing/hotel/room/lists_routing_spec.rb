require "spec_helper"

describe Hotel::Room::ListsController do
  describe "routing" do

    it "routes to #index" do
      get("/hotel_room_lists").should route_to("hotel_room_lists#index")
    end

    it "routes to #new" do
      get("/hotel_room_lists/new").should route_to("hotel_room_lists#new")
    end

    it "routes to #show" do
      get("/hotel_room_lists/1").should route_to("hotel_room_lists#show", :id => "1")
    end

    it "routes to #edit" do
      get("/hotel_room_lists/1/edit").should route_to("hotel_room_lists#edit", :id => "1")
    end

    it "routes to #create" do
      post("/hotel_room_lists").should route_to("hotel_room_lists#create")
    end

    it "routes to #update" do
      put("/hotel_room_lists/1").should route_to("hotel_room_lists#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/hotel_room_lists/1").should route_to("hotel_room_lists#destroy", :id => "1")
    end

  end
end
