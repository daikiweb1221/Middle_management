class Place < ApplicationRecord
  belongs_to :user
  belongs_to :subordinate

  validates :place_point, presence: true, length: { maximum: 65_535 }
end
