class Api::V1::TestController < ApplicationController

  def destroy_players
    Player.destroy_all
  end
end
