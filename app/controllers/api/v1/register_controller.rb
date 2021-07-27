class Api::V1::RegisterController < ApplicationController

  def create
    if player_params[:email] == player_params[:verify_email]
      player = Player.new(
                      email: player_params[:email].downcase,
                      password: player_params[:password],
                      password_confirmation: params[:password_confirmation]
                    )
      if player.save
        render json: PlayerSerializer.new(player), status: :created
      else
        render json: {'message': {'error': "Player was not registered" }}, status: :bad_request
      end
    else
      render json: {'message': {'error': "Player was not registered" }}, status: :bad_request
    end
  end

  private

  def player_params
    params.permit(:email, :verify_email, :password, :password_confirmation)
  end
end
