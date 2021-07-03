class UserGame < ApplicationRecord
  validates :username, presence: true

  belongs_to :game
  belongs_to :user
  belongs_to :stack
end
