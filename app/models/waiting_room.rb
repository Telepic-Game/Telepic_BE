class WaitingRoom < ApplicationRecord
  validates :room_code, presence: true
end
