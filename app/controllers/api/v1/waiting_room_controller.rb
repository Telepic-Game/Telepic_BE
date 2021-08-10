class Api::V1::WaitingRoomController < ApplicationController
  def get
    # Find players waiting room player object, to find waiting room
    player = Player.find_by(email: params[:email])
    waiting_room_player = WaitingRoomPlayer.find_by(player_id: player.id)
    waiting_room = waiting_room_player.waiting_room

    # Create openstruct object to pass to serializer
    to_render = OpenStruct.new(
          waiting_room: waiting_room_player.waiting_room,
          player: { "current_player":
            {
            "email": player.email,
            "username": waiting_room_player.username, "permissions": player.permissions
          },
          "all_players": waiting_room.waiting_room_players
        }
      )

    render json: WaitingRoomSerializer.new(to_render), status: 200
  end

  def create
    # Host player path
    player = Player.find_by(email: params[:email])
    player.permissions = 2
    waiting_room = WaitingRoom.create
    # Host creates a new game
    game = Game.create(
      turn_counter: 2,
    )
    # Host PlayerGame is created
    player_game = PlayerGame.create(
      game_id: game.id,
      player_id: player.id,
      username: params[:username],
    )
    # Host WaitingRoomPlayer is created
    WaitingRoomPlayer.create(
      waiting_room: waiting_room,
      player: player,
      username: params[:username],
    )
    # Response
    to_render = OpenStruct.new(
      waiting_room: "Waiting Room #{waiting_room.id} is Open",
      player: {email: player.email, id: player.id},
      game: game,
      player_game: player_game,
    )

    render json: WaitingRoomSerializer.new(to_render), status: 201
  end

  def create_more_players
    waiting_room = WaitingRoom.find_by(room_code: params[:room_code])
    # Registered player path
    if !params[:email].nil?
      player = Player.find_by(email: params[:email])
      # Make player games
      wrp = WaitingRoomPlayer.create(
        waiting_room: waiting_room,
        player: player,
        username: params[:username]
      )
      # Add player model
      to_render = OpenStruct.new(
        waiting_room: waiting_room.id,
        player: {
            'player_id': player.id,
            'player_username': wrp.username,
            'permissions': player.permissions
          }
        )
      render json: WaitingRoomSerializer.new(to_render), status: 201
    # Guest player path
    else
      # Create guest player
      player = Player.create(
        email: params[:username],
        password: params[:room_code],
        permissions: 0,
      )
      # Create guest player game
      wrp = WaitingRoomPlayer.create(
        waiting_room: waiting_room,
        player: player,
        username: params[:username]
      )
      to_render = OpenStruct.new(
        waiting_room: waiting_room.id,
        player: {
            'player_id': player.id,
            'player_username': wrp.username,
            'permissions': player.permissions
          }
        )
      render json: WaitingRoomSerializer.new(to_render), status: 201
    end
  end
end
