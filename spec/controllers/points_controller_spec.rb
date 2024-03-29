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

describe PointsController do
  let(:network) do
    FactoryGirl.create(:network)
  end
  # This should return the minimal set of attributes required to create a valid
  # Point. As you add validations to Point, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    { lat: 12 }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # PointsController. Be sure to keep this updated too.
  def valid_session
    { }
  end

  describe "GET index" do
    it "assigns all points as @points" do
      point = Point.create! valid_attributes
      get :index, {network_id: network.id}, valid_session
      assigns(:points).should eq([point])
    end
  end

  describe "GET show" do
    it "assigns the requested point as @point" do
      point = Point.create! valid_attributes
      get :show, {network_id: network.id, id: point.to_param}, valid_session
      assigns(:point).should eq(point)
    end
  end

  describe "GET new" do
    it "assigns a new point as @point" do
      get :new, {network_id: network.id}, valid_session
      assigns(:point).should be_a_new(Point)
    end
  end

  describe "GET edit" do
    it "assigns the requested point as @point" do
      point = Point.create! valid_attributes
      get :edit, {network_id: network.id, id: point.to_param}, valid_session
      assigns(:point).should eq(point)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Point" do
        expect {
          post :create, {network_id: network.id, point: valid_attributes}, valid_session
        }.to change(Point, :count).by(1)
      end

      it "assigns a newly created point as @point" do
        post :create, {network_id: network.id, point: valid_attributes}, valid_session
        assigns(:point).should be_a(Point)
        assigns(:point).should be_persisted
      end

      it "redirects to the created point" do
        post :create, {network_id: network.id, point: valid_attributes}, valid_session
        response.should redirect_to([network, Point.last])
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved point as @point" do
        # Trigger the behavior that occurs when invalid params are submitted
        Point.any_instance.stub(:save).and_return(false)
        post :create, {network_id: network.id, point: { "lat" => "invalid value" }}, valid_session
        assigns(:point).should be_a_new(Point)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Point.any_instance.stub(:save).and_return(false)
        post :create, {network_id: network.id, :point => { "lat" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested point" do
        point = Point.create! valid_attributes
        # Assuming there are no other points in the database, this
        # specifies that the Point created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Point.any_instance.should_receive(:update).with({ "lat" => "12" })
        put :update, {network_id: network.id, id: point.to_param, point: { "lat" => "12" }}, valid_session
      end

      it "assigns the requested point as @point" do
        point = Point.create! valid_attributes
        put :update, {network_id: network.id, id: point.to_param, point: valid_attributes}, valid_session
        assigns(:point).should eq(point)
      end

      it "redirects to the point" do
        point = Point.create! valid_attributes
        put :update, {network_id: network.id, :id => point.to_param, :point => valid_attributes}, valid_session
        response.should redirect_to([network,point])
      end
    end

    describe "with invalid params" do
      it "assigns the point as @point" do
        point = Point.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Point.any_instance.stub(:save).and_return(false)
        put :update, {network_id: network.id, :id => point.to_param, :point => { "lat" => "invalid value" }}, valid_session
        assigns(:point).should eq(point)
      end

      it "re-renders the 'edit' template" do
        point = Point.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Point.any_instance.stub(:save).and_return(false)
        put :update, {network_id: network.id, id: point.to_param, point: { "lat" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested point" do
      point = Point.create! valid_attributes
      expect {
        delete :destroy, {network_id: network.id, :id => point.to_param}, valid_session
      }.to change(Point, :count).by(-1)
    end

    it "redirects to the points list" do
      point = Point.create! valid_attributes
      delete :destroy, {network_id: network.id, id: point.to_param}, valid_session
      response.should redirect_to(network_points_url(network))
    end
  end

end
