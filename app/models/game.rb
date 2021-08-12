class Game < ApplicationRecord
  validates :turn_counter, presence: true

  after_initialize :set_active

  has_many :player_games
  has_many :players, through: :player_games
  has_many :waiting_room_players, through: :players
  has_many :waiting_rooms, through: :waiting_room_players
  has_many :stacks, through: :players
  has_many :cards, through: :stacks

  def set_active
    self.active = false
  end
end
