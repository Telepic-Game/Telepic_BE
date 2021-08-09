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
    waiting_room = WaitingRoom.create
    WaitingRoomPlayer.create(
      waiting_room: waiting_room,
      player: player,
      username: params[:username],
    )
    to_render = OpenStruct.new(
      waiting_room: "Waiting Room #{waiting_room.id} is Open",
      player: player
    )

    render json: WaitingRoomSerializer.new(to_render), status: 201
  end

  def create_more_players
    waiting_room = WaitingRoom.find_by(room_code: params[:room_code])
    require "pry"; binding.pry
    # Guest player path
      if !params[:email].nil?
        player = Player.find_by(email: params[:email])
        wrp = WaitingRoomPlayer.create(
          waiting_room: waiting_room,
          player: player,
          username: params[:username]
        )
        # Add player model
        to_render = OpenStruct.new(
          waiting_room: waiting_room.id,
          player: {
              'Player ID': player.id,
              'Player username': wrp.username,
              'Permissions': player.permissions
            }
          )
        render json: WaitingRoomSerializer.new(to_render), status: 201
      # Registered player path
      else
        wrp = WaitingRoomPlayer.create(
          waiting_room: waiting_room,
          player: player,
          username: params[:username]
        )
        to_render = OpenStruct.new(
          waiting_room: waiting_room.id,
          player: {
              'Player ID': player.id,
              'Player username': wrp.username,
              'Permissions': player.permissions
            }
          )
        render json: WaitingRoomSerializer.new(to_render), status: 201

      end
    end
  end
