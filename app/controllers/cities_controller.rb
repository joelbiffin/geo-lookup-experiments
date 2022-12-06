class CitiesController < ApplicationController
  def index
    render json: City.where(params[:q])
  end
end
