class Api::CommunicationsController < ApplicationController
  before_action :authenticate!

  def create
    subordinate = Subordinate.find(params[:id])
    current_user.communication(subordinate)
  end

  def destroy
    subordinate = current_user.communications.find(params[:id]).subordinate
    current_user.uncommunication(subordinate)
  end
end
