class Api::CommunicationsController < ApplicationController
  before_action :authenticate!

  def create
    subordinate = Subordinate.find(params[:id])
    current_user.communication(subordinate)
  end

  def destroy
    subordinate = current_user.communication_subordinates.find(params[:id])
    current_user.uncommunication(subordinate)
  end

  def destroy_all
    @destroy_all = current_user.communications.destroy_all
    render json: @destroy_all
  end
end
