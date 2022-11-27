class User < ApplicationRecord
  include JwtToken
  authenticates_with_sorcery!

  has_many :subordinates, dependent: :destroy
  has_many :everyday_behaviors, dependent: :destroy
  has_many :places, dependent: :destroy
  has_many :communications, dependent: :destroy
  has_many :communications_subordinates, through: :communications, source: :subordinate
  has_one_attached :avatar

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, uniqueness: true, presence: true
  validates :name, presence: true

  def communication(subordinate)
    communication_subordinates << subordinate
  end

  def uncommunication(subordinate)
    communication_subordinates.destroy(subordinate)
  end

  def communication?(subordinate)
    communication_subordinates.include?(subordinate)
  end

  def avatar_url
    avatar.attached? ? Rails.application.routes.url_helpers.rails_blob_path(avatar, only_path: true) : nil
  end
end
