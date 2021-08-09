class Api::V1::TestController < ApplicationController

  def destroy_database
    WaitingRoomPlayer.destroy_all
    WaitingRoom.destroy_all
    Player.destroy_all
  end
end
