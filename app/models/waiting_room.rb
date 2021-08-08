class WaitingRoom < ApplicationRecord
  before_create :generate_room_code

  has_many :waiting_room_players

  private

  def generate_room_code
    self.room_code = SecureRandom.urlsafe_base64(6)
  end
end
