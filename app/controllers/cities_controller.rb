class CitiesController < ApplicationController
  def index
    client = LocationIQClient.new(type: "city")

    render json: City.where(params[:q], client:)
  end
end
