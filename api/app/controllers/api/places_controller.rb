class Api::PlacesController < ApplicationController
  before_action :authenticate!

  def index
    @places = current_user.places.order(created_at: :desc)
    render json: @places
  end

  def create
    @place = current_user.places.build(place_params)

    if @place.save
      render json: @place
    else
      render json: @place.errors, status: :bad_request
    end
  end

  def destroy
  end

  private

  def place_params
    params.require(:place).permit(:place_point).merge(subordinate_id: params[:subordinate_id])
  end
end
