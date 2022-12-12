class CitiesController < ApplicationController
  def index
    render json: City.where(params[:q], client: client_klass.new(type: "city"))
  end

  private

  def client_klass
    {
      location_iq: LocationIQClient,
      esri: ArcgisClient,
      geoapify: GeoapifyClient,
    }.fetch(params[:client].to_sym, LocationIQClient)
  end
end
