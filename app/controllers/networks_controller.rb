class NetworksController < ApplicationController
  before_action :set_network, only: [:show, :edit, :update, :destroy]

  respond_to :html, :json

  # GET /networks
  def index
    @networks = Network.includes(:points)
  end

  # GET /networks/1
  def show
  end

  # GET /networks/new
  def new
    @network = Network.new
    2.times{ @network.points.build }
  end

  # GET /networks/1/edit
  def edit
    2.times{ @network.points.build }
  end

  # POST /networks
  def create
    @network = Network.new(network_params)

    respond_to do |format|
      if @network.save
        format.html { redirect_to @network, notice: 'Network was successfully created.' }
        format.json { render action: 'show', status: :created, network: @network }
      else
        format.html { render action: 'new' }
        format.json { render json: @network.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /networks/1
  def update
    respond_to do |format|
      if @network.update(network_params)
        format.html { redirect_to @network, notice: 'Network was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @network.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /networks/1
  def destroy
    @network.destroy
    respond_to do |format|
      format.html { redirect_to networks_url, notice: 'Network was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_network
      @network = Network.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def network_params
      params.require(:network).permit(:name, :color, :capacity, :description, points_attributes: [:lat, :lng])
    end
end
