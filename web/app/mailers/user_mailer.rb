class UserMailer < ApplicationMailer
  default from: Rails.application.credentials.gmail[:user_name]
  def reset_password_email(user)
    @user = User.find(user.id)
    @url = "https://middlemanagement.app.magia.runteq.jp/users_password_edit?token=#{user&.reset_password_token}"
    mail(to: user.email, subject: '【MiddleManagement】パスワード再設定')
  end
end
