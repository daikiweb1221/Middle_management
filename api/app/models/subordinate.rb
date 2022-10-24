class Subordinate < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  validates :birthday, presence: true
end
