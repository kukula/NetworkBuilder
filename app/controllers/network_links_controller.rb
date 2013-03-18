class NetworkLinksController < ApplicationController
  before_action :set_network_link, only: [:show, :edit, :update, :destroy]

  # GET /network_links
  def index
    @network_links = NetworkLink.all
  end

  # GET /network_links/1
  def show
  end

  # GET /network_links/new
  def new
    @network_link = NetworkLink.new
  end

  # GET /network_links/1/edit
  def edit
  end

  # POST /network_links
  def create
    @network_link = NetworkLink.new(network_link_params)

    if @network_link.save
      redirect_to @network_link, notice: 'Network link was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /network_links/1
  def update
    if @network_link.update(network_link_params)
      redirect_to @network_link, notice: 'Network link was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /network_links/1
  def destroy
    @network_link.destroy
    redirect_to network_links_url, notice: 'Network link was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_network_link
      @network_link = NetworkLink.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def network_link_params
      params.require(:network_link).permit(:start_lat, :start_lng, :end_lat, :end_lng, :capacity, :color, :description)
    end
end
