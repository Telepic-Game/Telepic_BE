class Api::V1::LoginController < ApplicationController

  def create
    # require "pry"; binding.pry
    user = User.find_by(email: user_params["email"])
    # require "pry"; binding.pry
    if user && user.authenticate(params["password_digest"])
      render json: LoginSerializer.new(user), status: 200
    else
      render json: {'Message': {'Error': "#{user.errors.full_messages}" }}, status: :bad_request
    end
  end

  private

  def user_params
    params.permit(:email, :password_digest)
  end
end
