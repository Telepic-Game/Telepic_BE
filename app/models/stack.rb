class Stack < ApplicationRecord
  has_many :user_games
  has_many :cards
end
