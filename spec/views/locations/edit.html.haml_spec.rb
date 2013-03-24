require 'spec_helper'

describe "locations/edit" do
  before(:each) do
    @location = assign(:location, stub_model(Location,
      :name => "MyString",
      :description => "MyText",
      :icon => "MyString",
      :lat => "",
      :lng => ""
    ))
  end

  it "renders the edit location form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", location_path(@location), "post" do
      assert_select "input#location_name[name=?]", "location[name]"
      assert_select "textarea#location_description[name=?]", "location[description]"
      assert_select "input#location_icon[name=?]", "location[icon]"
      assert_select "input#location_lat[name=?]", "location[lat]"
      assert_select "input#location_lng[name=?]", "location[lng]"
    end
  end
end
