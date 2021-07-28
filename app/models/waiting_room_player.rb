class WaitingRoomPlayer < ApplicationRecord
  belongs_to :player, dependent: :destroy
  belongs_to :waiting_room, dependent: :destroy
end
