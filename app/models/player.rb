class Player < ApplicationRecord
  validates :password, confirmation: true

  enum permissions: {
    guest: 0,
    registered: 1,
    host: 2,
    }

  has_secure_password

  has_one :waiting_room_player
  has_one :waiting_room, through: :waiting_room_player
  has_many :player_games
  has_many :games, through: :player_games
  has_one :stack
  has_many :cards, through: :stack
end
