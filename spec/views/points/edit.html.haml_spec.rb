require 'spec_helper'

describe "points/edit" do
  before(:each) do
    @network = assign(:network, stub_model(Network, id: 1))
    @point = assign(:point, stub_model(Point,
      network_id: 1,
      :lat => 1.5,
      :lng => 1.5
    ))
  end

  it "renders the edit point form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", network_point_path(@network, @point), "post" do
      assert_select "input#point_lat[name=?]", "point[lat]"
      assert_select "input#point_lng[name=?]", "point[lng]"
    end
  end
end
