require "spec_helper"

describe Hotel::Room::FieldsController do
  describe "routing" do

    it "routes to #index" do
      get("/hotel_room_fields").should route_to("hotel_room_fields#index")
    end

    it "routes to #new" do
      get("/hotel_room_fields/new").should route_to("hotel_room_fields#new")
    end

    it "routes to #show" do
      get("/hotel_room_fields/1").should route_to("hotel_room_fields#show", :id => "1")
    end

    it "routes to #edit" do
      get("/hotel_room_fields/1/edit").should route_to("hotel_room_fields#edit", :id => "1")
    end

    it "routes to #create" do
      post("/hotel_room_fields").should route_to("hotel_room_fields#create")
    end

    it "routes to #update" do
      put("/hotel_room_fields/1").should route_to("hotel_room_fields#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/hotel_room_fields/1").should route_to("hotel_room_fields#destroy", :id => "1")
    end

  end
end
