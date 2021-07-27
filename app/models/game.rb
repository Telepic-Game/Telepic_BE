class Game < ApplicationRecord
  validates :turn_counter, presence: true
  validates :active, presence: true

  has_many :player_games
  has_many :players, through: :player_games
  has_many :stacks, through: :players
  has_many :cards, through: :stacks
end
