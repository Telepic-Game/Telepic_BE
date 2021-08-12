class WaitingRoomSerializer
  include FastJsonapi::ObjectSerializer
  attributes :waiting_room, :player, :game, :player_game
  set_id { 'null' }
end

