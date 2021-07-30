class Player < ApplicationRecord
  validates :password, confirmation: true

  before_create :guest_status

  enum permissions: {
    guest: 0,
    registered: 1,
    host: 2,
    }

  has_secure_password

  has_many :player_games
  has_many :games, through: :player_games
  has_one :stack
  has_many :cards, through: :stack

  private

  def guest_status
    if self.password.nil?
      self.password = 'guest'
      # self.permissions = 0
      # self.id = 10000
    end
  end
end
