class PlayerGame < ApplicationRecord
  validates :username, presence: true

  belongs_to :game
  belongs_to :player
end
