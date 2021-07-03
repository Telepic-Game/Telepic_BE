class Game < ApplicationRecord
  validates :turn_counter, presence: true
  validates :active, presence: true

  has_many :user_games
  has_many :users, through: :user_games
  has_many :stacks, through: :user_games
end
