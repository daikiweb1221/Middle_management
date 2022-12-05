class Event < ApplicationRecord
  belongs_to :user

  validates :name, presence: true, length: { maximum: 100 }
  validates :start, presence: true
  validates :end, presence: true
end
