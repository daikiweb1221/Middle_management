namespace :remaind_birthday do
  desc "部下の誕生日がきたらメールでお知らせする"
	task remaind_birthday_mail: :environment do
    Subordinate.remaind_birthday_mail
  end
end
