class Api::V1::RegisterController < ApplicationController

  def create
    user = User.new(user_params)
    if user.save
      render json: UserSerializer.new(user), status: :created
    else
      render json: {'Message': {'Error': "#{user.errors.full_messages}" }}, status: :bad_request
    end
  end

  private

  def user_params
    params.permit(:email, :password_digest)
  end
end
