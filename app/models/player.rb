class Player < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :password, confirmation: true

  has_secure_password

  has_many :player_games
  has_many :games, through: :player_games
  has_one :stack
  has_many :cards, through: :stack
end
