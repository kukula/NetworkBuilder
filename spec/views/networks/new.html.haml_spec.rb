require 'spec_helper'

describe "networks/new" do
  before(:each) do
    assign(:network, stub_model(Network,
      :name => "MyString",
      :color => "MyString",
      :capacity => 1,
      :description => "MyText"
    ).as_new_record)
  end

  it "renders new network form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", networks_path, "post" do
      assert_select "input#network_name[name=?]", "network[name]"
      assert_select "input#network_color[name=?]", "network[color]"
      assert_select "input#network_capacity[name=?]", "network[capacity]"
      assert_select "textarea#network_description[name=?]", "network[description]"
    end
  end
end
