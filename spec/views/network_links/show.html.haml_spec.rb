require 'spec_helper'

describe "network_links/show" do
  before(:each) do
    @network_link = assign(:network_link, stub_model(NetworkLink,
      :start_lat => 1.5,
      :start_lng => 1.5,
      :end_lat => 1.5,
      :end_lng => 1.5,
      :capacity => 1,
      :color => "Color",
      :description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1.5/)
    rendered.should match(/1.5/)
    rendered.should match(/1.5/)
    rendered.should match(/1.5/)
    rendered.should match(/1/)
    rendered.should match(/Color/)
    rendered.should match(/Description/)
  end
end
