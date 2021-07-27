class Api::V1::LoginController < ApplicationController

  def create
    #This is for the login
    player = Player.find_by(email: player_params["email"])
    if player && player.authenticate(params["password_digest"])
      render json: LoginSerializer.new(player), status: 200
    else
      render json: {'message': {'error': "There was an error with your login attempt." }}, status: :bad_request
    end
  end

  private

  def player_params
    params.permit(:email, :password_digest)
  end
end
