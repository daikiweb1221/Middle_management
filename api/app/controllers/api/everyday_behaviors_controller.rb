class Api::EverydayBehaviorsController < ApplicationController
  before_action :authenticate!
  before_action :set_behavior, only: [:update]

  def index
    @everyday_behaviors = current_user.everyday_behaviors
    render json: @everyday_behaviors
  end

  def create
    @everyday_behavior = current_user.everyday_behaviors.build(everyday_behavior_params)

    if @everyday_behavior.save
      render json: @everyday_behavior
    else
      render json: @everyday_behavior.errors, status: :bad_request
    end
  end

  def update
    if @everyday_behavior.update(everyday_behavior_params)
      render json: @everyday_behavior
    else
      render json: @everyday_behavior.errors, status: :bad_request
    end
  end

  private
  def set_behavior
    @everyday_behavior = current_user.everyday_behaviors.find(params[:id])
  end

  def everyday_behavior_params
    params.require(:everyday_behavior).permit(:behaviors_one, :behaviors_two, :behaviors_three, :behaviors_four, :behaviors_five)
  end
end

