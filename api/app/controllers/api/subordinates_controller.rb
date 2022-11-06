class Api::SubordinatesController < ApplicationController
  before_action :authenticate!
  before_action :set_subordinate, only: [:show, :update, :destroy]

  def index
    @subordinates = current_user.subordinates
    render json: @subordinates
  end

  def show
    render json: @subordinate
  end

  def create
    @subordinate = current_user.subordinates.build(subordinate_params)

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
    @subordinate = current_user.subordinates.find(params[:id])
  end

  def subordinate_params
    params.require(:subordinate).permit(:name, :email, :birthday)
  end
end
