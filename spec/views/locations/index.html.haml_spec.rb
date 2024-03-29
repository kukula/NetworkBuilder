require 'spec_helper'

describe "locations/index" do
  before(:each) do
    assign(:locations, [
      stub_model(Location,
        :name => "Name",
        :description => "MyText",
        :icon => "Icon",
        :lat => "12",
        :lng => "21"
      ),
      stub_model(Location,
        :name => "Name",
        :description => "MyText",
        :icon => "Icon",
        :lat => "12",
        :lng => "21"
      )
    ])
  end

  it "renders a list of locations" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Icon".to_s, :count => 2
  end
end
