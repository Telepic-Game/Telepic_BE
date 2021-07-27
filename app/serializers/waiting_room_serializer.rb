class WaitingRoomSerializer
  include FastJsonapi::ObjectSerializer
  attributes :waiting_room, :player
  set_id { 'null' }
end

