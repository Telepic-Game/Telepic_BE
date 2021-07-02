class UserGame < ApplicationRecord
  belongs_to :game
  belongs_to :user
  belongs_to :stack
end
