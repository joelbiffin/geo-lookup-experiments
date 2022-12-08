class CitiesController < ApplicationController
  def index
    client = GeoapifyClient.new(type: "city")

    render json: City.where(params[:q], client:)
  end
end
