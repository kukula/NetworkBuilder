require 'spec_helper'

describe "points/index" do
  before(:each) do
    assign(:network, stub_model(Network, id: 1))
    assign(:points, [
      stub_model(Point,
        :lat => 1.2,
        :lng => 1.5
      ),
      stub_model(Point,
        :lat => 1.2,
        :lng => 1.5
      )
    ])
  end

  it "renders a list of points" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.2.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
  end
end
