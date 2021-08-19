class Api::V1::GamesController < ApplicationController

  def start
    #This is
    player = Player.find_by(email: params["email"])
    waiting_room = WaitingRoom.find_by(room_code: params["room_code"])
    game = waiting_room.games.first
    if game
      # Game.all.first = true
      # Game.update(game.id, :active => true)
      game.calculate_rounds
      game.update(active: true)
      game.save
      to_render = OpenStruct.new(
        game: game,
        game_players: game.players
      )
      render json: GameSerializer.new(to_render), status: 200
    else
      render json: { 'message': { 'error': "Game does not exist." } }, status: :bad_request
    end
  end
end
