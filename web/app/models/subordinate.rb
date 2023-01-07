class Subordinate < ApplicationRecord
  belongs_to :user
  has_many :places, dependent: :destroy
  has_many :communications, dependent: :destroy

  validates :name, presence: true, length: { maximum: 20 }

  def self.remaind_birthday_mail
    subordinates = Subordinate.all
    today = Date.today.month.to_s + Date.today.day.to_s

    subordinates.each do |subordinate|
      if subordinate.birthday.present?
        month = subordinate.birthday.month.to_s
        day = subordinate.birthday.day.to_s
        subordinate_birthday = month + day
      end

      if subordinate_birthday == today
        RemaindBirthdayMailer.remaind_birthday(subordinate).deliver_now
      end
    end
  end
end
