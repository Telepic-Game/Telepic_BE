class Api::V1::WaitingRoomController < ApplicationController
  def get
    # Find players waiting room player object, to find waiting room
    player = Player.find_by(email: params[:email])
    waiting_room_player = WaitingRoomPlayer.find_by(player_id: player.id)

    # Create openstruct object to pass to serializer
    to_render = OpenStruct.new(
      waiting_room: waiting_room_player.waiting_room,
      player: { "email": player.email, "username": waiting_room_player.username },
    )

    render json: WaitingRoomSerializer.new(to_render), status: 200
  end

  def create
    # host path
    player = Player.find_by(email: params[:email])
    waiting_room = WaitingRoom.create
    WaitingRoomPlayer.create(
      waiting_room: waiting_room,
      player: player,
      username: params[:username],
    )
    to_render = OpenStruct.new(
      waiting_room: waiting_room,
      player: player,
    )

    render json: WaitingRoomSerializer.new(to_render), status: 200
  end

  # def create_more_players
    # waiting_room = WaitingRoom.find_by(room_code: params[:room_code])

    # wrp = WaitingRoomPlayer.new(
    #   waiting_room: waiting_room,
    #   player: player
    # )
  # end
end
