class Subordinate < ApplicationRecord
  belongs_to :user
  has_many :places, dependent: :destroy
  validates :name, presence: true, length: { maximum: 20 }
end
