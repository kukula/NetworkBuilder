require 'spec_helper'

describe "network_links/index" do
  before(:each) do
    assign(:network_links, [
      stub_model(NetworkLink,
        :start_lat => 1.5,
        :start_lng => 1.5,
        :end_lat => 1.5,
        :end_lng => 1.5,
        :capacity => 1,
        :color => "Color",
        :description => "Description"
      ),
      stub_model(NetworkLink,
        :start_lat => 1.5,
        :start_lng => 1.5,
        :end_lat => 1.5,
        :end_lng => 1.5,
        :capacity => 1,
        :color => "Color",
        :description => "Description"
      )
    ])
  end

  it "renders a list of network_links" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Color".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
