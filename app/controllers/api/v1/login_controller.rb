class Api::V1::LoginController < ApplicationController

  def create
    user = User.find_by(email: user_params["email"])
    if user && user.authenticate(params["password_digest"])
      render json: LoginSerializer.new(user), status: 200
    else
      render json: {'message': {'error': "There was an error with your login attempt." }}, status: :bad_request
    end
  end

  private

  def user_params
    params.permit(:email, :password_digest)
  end
end
