require 'spec_helper'

describe "networks/index" do
  before(:each) do
    assign(:networks, [
      stub_model(Network,
        :name => "Name",
        :color => "Color",
        :capacity => 1,
        :description => "MyText"
      ),
      stub_model(Network,
        :name => "Name",
        :color => "Color",
        :capacity => 1,
        :description => "MyText"
      )
    ])
  end

  it "renders a list of networks" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Color".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
