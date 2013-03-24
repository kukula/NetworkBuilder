require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe NetworksController do

  # This should return the minimal set of attributes required to create a valid
  # Network. As you add validations to Network, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    { "name" => "MyString" }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # NetworksController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all networks as @networks" do
      network = Network.create! valid_attributes
      get :index, {}, valid_session
      assigns(:networks).should eq([network])
    end
  end

  describe "GET show" do
    it "assigns the requested network as @network" do
      network = Network.create! valid_attributes
      get :show, {:id => network.to_param}, valid_session
      assigns(:network).should eq(network)
    end
  end

  describe "GET new" do
    it "assigns a new network as @network" do
      get :new, {}, valid_session
      assigns(:network).should be_a_new(Network)
    end
  end

  describe "GET edit" do
    it "assigns the requested network as @network" do
      network = Network.create! valid_attributes
      get :edit, {:id => network.to_param}, valid_session
      assigns(:network).should eq(network)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Network" do
        expect {
          post :create, {:network => valid_attributes}, valid_session
        }.to change(Network, :count).by(1)
      end

      it "assigns a newly created network as @network" do
        post :create, {:network => valid_attributes}, valid_session
        assigns(:network).should be_a(Network)
        assigns(:network).should be_persisted
      end

      it "redirects to the created network" do
        post :create, {:network => valid_attributes}, valid_session
        response.should redirect_to(Network.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved network as @network" do
        # Trigger the behavior that occurs when invalid params are submitted
        Network.any_instance.stub(:save).and_return(false)
        post :create, {:network => { "name" => "invalid value" }}, valid_session
        assigns(:network).should be_a_new(Network)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Network.any_instance.stub(:save).and_return(false)
        post :create, {:network => { "name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested network" do
        network = Network.create! valid_attributes
        # Assuming there are no other networks in the database, this
        # specifies that the Network created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Network.any_instance.should_receive(:update).with({ "name" => "MyString" })
        put :update, {:id => network.to_param, :network => { "name" => "MyString" }}, valid_session
      end

      it "assigns the requested network as @network" do
        network = Network.create! valid_attributes
        put :update, {:id => network.to_param, :network => valid_attributes}, valid_session
        assigns(:network).should eq(network)
      end

      it "redirects to the network" do
        network = Network.create! valid_attributes
        put :update, {:id => network.to_param, :network => valid_attributes}, valid_session
        response.should redirect_to(network)
      end
    end

    describe "with invalid params" do
      it "assigns the network as @network" do
        network = Network.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Network.any_instance.stub(:save).and_return(false)
        put :update, {:id => network.to_param, :network => { "name" => "invalid value" }}, valid_session
        assigns(:network).should eq(network)
      end

      it "re-renders the 'edit' template" do
        network = Network.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Network.any_instance.stub(:save).and_return(false)
        put :update, {:id => network.to_param, :network => { "name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested network" do
      network = Network.create! valid_attributes
      expect {
        delete :destroy, {:id => network.to_param}, valid_session
      }.to change(Network, :count).by(-1)
    end

    it "redirects to the networks list" do
      network = Network.create! valid_attributes
      delete :destroy, {:id => network.to_param}, valid_session
      response.should redirect_to(networks_url)
    end
  end

end
