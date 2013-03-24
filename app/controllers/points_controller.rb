class PointsController < ApplicationController
  before_action :set_network
  before_action :set_point, only: [:show, :edit, :update, :destroy]

  # GET /points
  def index
    @points = Point.all
  end

  # GET /points/1
  def show
  end

  # GET /points/new
  def new
    @point = Point.new
  end

  # GET /points/1/edit
  def edit
  end

  # POST /points
  def create
    @point = Point.new(point_params)

    if @point.save
      redirect_to [@network, @point], notice: 'Point was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /points/1
  def update
    if @point.update(point_params)
      redirect_to [@network, @point], notice: 'Point was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /points/1
  def destroy
    @point.destroy
    redirect_to network_points_url(@network), notice: 'Point was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_network
      @network = Network.find(params[:network_id])
    end

    def set_point
      @point = Point.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def point_params
      params.require(:point).permit(:network_id, :lat, :lng)
    end
end
