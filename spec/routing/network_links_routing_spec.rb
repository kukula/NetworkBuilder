require "spec_helper"

describe NetworkLinksController do
  describe "routing" do

    it "routes to #index" do
      get("/network_links").should route_to("network_links#index")
    end

    it "routes to #new" do
      get("/network_links/new").should route_to("network_links#new")
    end

    it "routes to #show" do
      get("/network_links/1").should route_to("network_links#show", :id => "1")
    end

    it "routes to #edit" do
      get("/network_links/1/edit").should route_to("network_links#edit", :id => "1")
    end

    it "routes to #create" do
      post("/network_links").should route_to("network_links#create")
    end

    it "routes to #update" do
      put("/network_links/1").should route_to("network_links#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/network_links/1").should route_to("network_links#destroy", :id => "1")
    end

  end
end
