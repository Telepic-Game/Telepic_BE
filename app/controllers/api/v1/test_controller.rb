class Api::V1::TestController < ApplicationController

  def destroy_users
    User.destroy_all
  end
end
