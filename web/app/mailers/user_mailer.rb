class UserMailer < ApplicationMailer
  def reset_password_email(user)
    @user = User.find(user.id)
    @url = "#{Settings.site.top_url}users_password_edit?token=#{user&.reset_password_token}"
    mail(to: user.email, subject: '【MiddleManagement】パスワード再設定')
  end
end
