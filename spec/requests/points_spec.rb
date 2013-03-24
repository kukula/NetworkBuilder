require 'spec_helper'

describe "Points" do
  let(:network){FactoryGirl.create(:network)}
  describe "GET /network/:network_id/points" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get network_points_path(network)
      response.status.should be(200)
    end
  end
end
