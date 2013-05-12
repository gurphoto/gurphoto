require "spec_helper"

describe User::AgenciesController do
  describe "routing" do

    it "routes to #index" do
      get("/user_agencies").should route_to("user_agencies#index")
    end

    it "routes to #new" do
      get("/user_agencies/new").should route_to("user_agencies#new")
    end

    it "routes to #show" do
      get("/user_agencies/1").should route_to("user_agencies#show", :id => "1")
    end

    it "routes to #edit" do
      get("/user_agencies/1/edit").should route_to("user_agencies#edit", :id => "1")
    end

    it "routes to #create" do
      post("/user_agencies").should route_to("user_agencies#create")
    end

    it "routes to #update" do
      put("/user_agencies/1").should route_to("user_agencies#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/user_agencies/1").should route_to("user_agencies#destroy", :id => "1")
    end

  end
end
