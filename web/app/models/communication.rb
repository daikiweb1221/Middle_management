class Communication < ApplicationRecord
  belongs_to :user
  belongs_to :subordinate

  validates :user_id, uniqueness: { scope: :subordinate_id }
end
