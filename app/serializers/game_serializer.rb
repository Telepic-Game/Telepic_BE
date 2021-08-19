class GameSerializer
  include FastJsonapi::ObjectSerializer
  attributes :game, :game_players
  set_id { 'null' }
end
