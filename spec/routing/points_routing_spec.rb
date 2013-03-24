require "spec_helper"

describe PointsController do
  describe "routing" do

    it "routes to #index" do
      get("/networks/1/points").should route_to("points#index", network_id: "1")
    end

    it "routes to #new" do
      get("/networks/1/points/new").should route_to("points#new", network_id: "1")
    end

    it "routes to #show" do
      get("/networks/1/points/1").should route_to("points#show", network_id: "1", id: "1")
    end

    it "routes to #edit" do
      get("/networks/1/points/1/edit").should route_to("points#edit", network_id: "1", id: "1")
    end

    it "routes to #create" do
      post("/networks/1/points").should route_to("points#create", network_id: "1")
    end

    it "routes to #update" do
      put("/networks/1/points/1").should route_to("points#update", network_id: "1", id: "1")
    end

    it "routes to #destroy" do
      delete("/networks/1/points/1").should route_to("points#destroy", network_id: "1", id: "1")
    end

  end
end
