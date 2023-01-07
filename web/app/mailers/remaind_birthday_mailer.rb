class RemaindBirthdayMailer < ApplicationMailer
  def remaind_birthday(subordinate)
    @subordinate = subordinate
    @user = subordinate.user
    mail(to: @user.email, subject: "#{@subordinate.name}さんの誕生日のお知らせ")
  end
end
