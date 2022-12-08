class CitiesController < ApplicationController
  def index
    client = ArcgisClient.new(type: "city")

    render json: City.where(params[:q], client:)
  end
end
