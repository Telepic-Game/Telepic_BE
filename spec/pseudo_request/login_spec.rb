require 'rails_helper'

RSpec.describe 'User login', type: :request do
  it 'User can log in' do
    User.destroy_all

    attributes_1 = {
      "email": "example@whatever.com",
      "password": "password123",
      "password_confirmation": "password123"
    }

    post api_v1_register_index_path, params: attributes_1

    attributes_2 = {
      email: "example@whatever.com",
      password_digest: "password123",
      password_confirmation: "password123"
    }

    post api_v1_login_index_path, params: attributes_2

    user = JSON.parse(response.body, symbolize_names: true)
# require "pry"; binding.pry
    expect(response).to be_successful
    expect(response.status).to eq(200)
    expect(user[:data]).to be_a(Hash)
    expect(user[:data].keys).to match_array([:id, :type, :attributes])
    expect(user[:data][:id]).to be_a(String)
    expect(user[:data][:type]).to be_a(String)
    expect(user[:data][:type]).to eq("login")
    expect(user[:data][:attributes]).to be_a(Hash)
    expect(user[:data][:attributes].keys).to match_array([:email])
    expect(user[:data][:attributes][:email]).to be_a(String)
  end
  it 'User will be registered, but not able to login, when given blank password and password confirmation input' do
    User.destroy_all

    attributes_1 = {
      "email": "example@whatever.com",
      "password": "password123",
      "password_confirmation": "password123"
    }

    post api_v1_register_index_path, params: attributes_1

    attributes_2 = {
      email: "example@whatever.com",
      password_digest: "",
      password_confirmation: ""
    }

    post api_v1_login_index_path, params: attributes_2

    user = JSON.parse(response.body, symbolize_names: true)

    expect(response).not_to be_successful
    expect(response.status).to eq(400)
    expect(user[:message][:error]).to eq("There was an error with your login attempt.")
  end
end
