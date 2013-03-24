require 'spec_helper'

describe "locations/new" do
  before(:each) do
    assign(:location, stub_model(Location,
      :name => "MyString",
      :description => "MyText",
      :icon => "MyString",
      :lat => "",
      :lng => ""
    ).as_new_record)
  end

  it "renders new location form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", locations_path, "post" do
      assert_select "input#location_name[name=?]", "location[name]"
      assert_select "textarea#location_description[name=?]", "location[description]"
      assert_select "input#location_icon[name=?]", "location[icon]"
      assert_select "input#location_lat[name=?]", "location[lat]"
      assert_select "input#location_lng[name=?]", "location[lng]"
    end
  end
end
