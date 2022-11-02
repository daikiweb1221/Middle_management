class Api::SubordinatesController < ApplicationController
  before_action :set_subordinate, only: [:show, :update, :destroy]

  def index
    @subordinates = Subordinate.all
    render json: @subordinates
  end

  def show
    render json: @subordinate
  end

  def create
    @subordinate = Subordinate.new(subordinate_params)

    if @subordinate.save
      render json: @subordinate
    else
      render json: @subordinate.errors, status: :bad_request
    end
  end

  def update
    if @subordinate.update(subordinate_params)
      render json: @subordinate
    else
      render json: @subordinate.errors, status: :bad_request
    end
  end

  def destroy
    @subordinate.destroy!
    render json: @subordinate
  end

  private
  def set_subordinate
    @subordinate = Subordinate.find(params[:id])
  end

  def subordinate_params
    params.require(:subordinate).permit(:name, :email, :birthday)
  end
end
