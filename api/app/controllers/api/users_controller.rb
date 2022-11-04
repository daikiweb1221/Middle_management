class Api::UsersController < ApplicationController
  before_action :authenticate!, only: %i[me]

  def create
    user = User.new(user_params)

    if user.save
      render json: user
    else
      render json: user.errors, status: :bad_request
    end
  end

	# HTTPヘッダー中のトークン情報を用いて、ログインユーザーの情報を返すためのエンドポイント
  def me
    render json: current_user
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name)
  end
end
