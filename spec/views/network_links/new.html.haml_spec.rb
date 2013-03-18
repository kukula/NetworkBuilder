require 'spec_helper'

describe "network_links/new" do
  before(:each) do
    assign(:network_link, stub_model(NetworkLink,
      :start_lat => 1.5,
      :start_lng => 1.5,
      :end_lat => 1.5,
      :end_lng => 1.5,
      :capacity => 1,
      :color => "MyString",
      :description => "MyString"
    ).as_new_record)
  end

  it "renders new network_link form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", network_links_path, "post" do
      assert_select "input#network_link_start_lat[name=?]", "network_link[start_lat]"
      assert_select "input#network_link_start_lng[name=?]", "network_link[start_lng]"
      assert_select "input#network_link_end_lat[name=?]", "network_link[end_lat]"
      assert_select "input#network_link_end_lng[name=?]", "network_link[end_lng]"
      assert_select "input#network_link_capacity[name=?]", "network_link[capacity]"
      assert_select "input#network_link_color[name=?]", "network_link[color]"
      assert_select "input#network_link_description[name=?]", "network_link[description]"
    end
  end
end
