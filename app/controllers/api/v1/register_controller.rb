class Api::V1::RegisterController < ApplicationController
  

  def create
    # user = User.new(user_params)

    render json: { "message": {"User created": "sweet" }}, status: :created
    # require "pry"; binding.pry
  end

  private

  def user_params
    params.require(:email, :password_digest)
  end
end
