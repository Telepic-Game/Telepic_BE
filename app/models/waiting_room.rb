class WaitingRoom < ApplicationRecord
  before_create :generate_room_code

  private

  def generate_room_code
    self.room_code = SecureRandom.urlsafe_base64(6)
  end
end
