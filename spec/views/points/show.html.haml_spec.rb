require 'spec_helper'

describe "points/show" do
  before(:each) do
    @network = assign(:network, stub_model(Network, id: 1))
    @point = assign(:point, stub_model(Point,
      :lat => 1.5,
      :lng => 1.6
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1.5/)
    rendered.should match(/1.6/)
  end
end
