class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true

  has_secure_password

  has_many :user_games
  has_many :games, through: :user_games
  has_many :stacks, through: :user_games
end
