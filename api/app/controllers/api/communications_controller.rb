class Api::CommunicationsController < ApplicationController
  def create
    subordinate = Subordinate.find(params[:subordinate_id])
    @communication = current_user.communication(subordinate)
    render json: @communication
  end

  def destroy
    subordinate = current_user.communications.find(params[:id]).subordinate
    @uncommunication = current_user.uncommunication(subordinate)
    render json: @uncommunication
  end
end
