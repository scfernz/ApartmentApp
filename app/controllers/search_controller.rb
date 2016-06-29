class SearchController < ApplicationController
  def search
    @apartments = Apartment.basic_search(params[:query])
    @pindrop = Gmaps4rails.build_markers(@apartments) do |apartment, marker|
      marker.lat apartment.latitude
      marker.lng apartment.longitude
      marker.infowindow apartment.address
    end
    @user = User.all
    render "/apartments/index.html.erb"
  end
end
