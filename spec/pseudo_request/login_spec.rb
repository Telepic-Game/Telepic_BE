require 'rails_helper'

RSpec.describe 'User login', type: :request do
  it 'User can log in' do
    User.destroy_all

    attributes_1 = {
      "email": "example@whatever.com",
      "password_digest": "password123",
    }

    post api_v1_register_index_path, params: attributes_1

    user_1 = User.create(
      "email": "example@whatever.com",
      "password_digest": "password123",
      "password_confirmation": "password123"
    )

    attributes_2 = {
      email: "example@whatever.com",
      password_digest: "password123",
      password_confirmation: "password123"
    }
    require "pry"; binding.pry
    post api_v1_login_index_path, params: attributes_2

    user = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.status).to eq(200)
    expect(user[:data]).to be_a(Hash)
  end
  # it 'User will not be registered, when given blank input' do
  #   User.destroy_all
  #   attributes = {
  #     "email": "",
  #     "password_digest": "password123",
  #   }
  #   post api_v1_register_index_path, params: attributes
  #
  #   expect(response).not_to be_successful
  #   expect(response.status).to eq(400)
  # end

end
