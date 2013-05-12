require "spec_helper"

describe User::AdminsController do
  describe "routing" do

    it "routes to #index" do
      get("/user_admins").should route_to("user_admins#index")
    end

    it "routes to #new" do
      get("/user_admins/new").should route_to("user_admins#new")
    end

    it "routes to #show" do
      get("/user_admins/1").should route_to("user_admins#show", :id => "1")
    end

    it "routes to #edit" do
      get("/user_admins/1/edit").should route_to("user_admins#edit", :id => "1")
    end

    it "routes to #create" do
      post("/user_admins").should route_to("user_admins#create")
    end

    it "routes to #update" do
      put("/user_admins/1").should route_to("user_admins#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/user_admins/1").should route_to("user_admins#destroy", :id => "1")
    end

  end
end
