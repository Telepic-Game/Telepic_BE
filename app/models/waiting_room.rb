class WaitingRoom < ApplicationRecord
  before_create :generate_room_code

  has_many :waiting_room_players
  has_many :players, through: :waiting_room_players
  has_many :player_games, through: :players
  has_many :games, through: :player_games

  private

  def generate_room_code
    self.room_code = SecureRandom.urlsafe_base64(6)
  end
end
