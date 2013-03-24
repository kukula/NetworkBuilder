require 'spec_helper'

describe "networks/show" do
  before(:each) do
    @network = assign(:network, stub_model(Network,
      :name => "Name",
      :color => "Color",
      :capacity => 1,
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Color/)
    rendered.should match(/1/)
    rendered.should match(/MyText/)
  end
end
