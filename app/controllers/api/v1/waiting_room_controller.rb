class Api::V1::WaitingRoomController < ApplicationController
  def create
    # host path
    # begin
      player = Player.find_by(email: params[:email])
      waiting_room = WaitingRoom.create
      WaitingRoomPlayer.create(
        waiting_room: waiting_room,
        player: player,
      )
      to_render = OpenStruct.new(
        waiting_room: waiting_room,
        player: player,
      )

      render json: WaitingRoomSerializer.new(to_render), status: 200
    # rescue
    #   render json: { error: 'Player not found' }, status: :not_found
    # end
    # WaitingRoomSerializer.new(stuff)
    # Response: room_code, waiting_room_id, host_email
  end

  # def create_more_players
    # waiting_room = WaitingRoom.find_by(room_code: params[:room_code])

    # wrp = WaitingRoomPlayer.new(
    #   waiting_room: waiting_room,
    #   player: player
    # )
  # end
end
