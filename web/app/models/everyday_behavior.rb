class EverydayBehavior < ApplicationRecord
  belongs_to :user
  validates :behaviors_one, presence: true, length: { maximum: 30 }
  validates :behaviors_two, presence: true, length: { maximum: 30 }
  validates :behaviors_three, presence: true, length: { maximum: 30 }
  validates :behaviors_four, presence: true, length: { maximum: 30 }
  validates :behaviors_five, presence: true, length: { maximum: 30 }
end
