class Api::V1::RegisterController < ApplicationController

  def create
    user = User.new(
                    email: user_params[:email].downcase,
                    password: user_params[:password],
                    password_confirmation: params[:password_confirmation]
                  )
    if user.save
      render json: UserSerializer.new(user), status: :created
    else
      render json: {'message': {'error': "#{user.errors.full_messages}" }}, status: :bad_request
    end
  end

  private

  def user_params
    params.permit(:email, :password)
  end
end
