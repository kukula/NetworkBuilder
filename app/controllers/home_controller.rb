class HomeController < ApplicationController
  def index
    @network_links = NetworkLink.all
  end
end
