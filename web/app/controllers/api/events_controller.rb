class Api::EventsController < ApplicationController
  before_action :authenticate!
  before_action :set_event, only: [:show, :update, :destroy]

  def index
    @events = current_user.events.all
    render json: @events
  end

  def show
    render json: @event
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      render json: @event
    else
      render json: @event.errors, status: :bad_request
    end
  end

  def update
    if @event.update(event_params)
      render json: @event
    else
      render json: @event.errors, status: :bad_request
    end
  end

  def destroy
    @event.destroy!
    render json: @event
  end

  private
  def set_event
    @event = current_user.events.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:id, :name, :start, :end, :timed, :description, :color, :user_id)
  end

end
