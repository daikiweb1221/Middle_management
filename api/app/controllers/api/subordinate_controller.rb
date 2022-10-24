class Api::SubordinateController < ApplicationController
  before_action :set_subordinates, only: [:show, :update, :destroy]

  def index
    @subordinates = Subordinate.all
    render json: @subordinates
  end

  def show
    render json: @subordinates
  end

  def create
    @subordinates = Subordinate.new(subordinates_params)

    if @subordinates.save
      render json: @subordinates
    else
      render json: @subordinates.errors, status: :bad_request
    end
  end

  def update
    if @subordinates.update(subordinates_params)
      render json: @subordinates
    else
      render json: @subordinates.errors, status: :bad_request
    end
  end

  def destroy
    @subordinates.destroy!
    render json: @subordinates
  end

  private
  def set_subordinates
    @subordinates = Subordinate.find(params[:id])
  end

  def subordinates_params
    params.require(:subordinates).permit(:name, :email, :birthday)
  end
end
