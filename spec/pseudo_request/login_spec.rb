require 'rails_helper'

RSpec.describe 'Player login', type: :request do
  it 'Player can log in' do
    Player.destroy_all

    attributes_1 = {
      "email": "example@whatever.com",
      "verify_email": "example@whatever.com",
      "password": "password123",
      "password_confirmation": "password123"
    }

    post api_v1_register_index_path, params: attributes_1

    attributes_2 = {
      email: "example@whatever.com",
      verify_email: "example@whatever.com",
      password_digest: "password123",
      password_confirmation: "password123"
    }

    post api_v1_login_index_path, params: attributes_2

    player = JSON.parse(response.body, symbolize_names: true)
    expect(response).to be_successful
    expect(response.status).to eq(200)
    expect(player[:data]).to be_a(Hash)
    expect(player[:data].keys).to match_array([:id, :type, :attributes])
    expect(player[:data][:id]).to be_a(String)
    expect(player[:data][:type]).to be_a(String)
    expect(player[:data][:type]).to eq("login")
    expect(player[:data][:attributes]).to be_a(Hash)
    expect(player[:data][:attributes].keys).to match_array([:email])
    expect(player[:data][:attributes][:email]).to be_a(String)
  end
  it 'Player will be registered, but not able to login, when given blank password and password confirmation input' do
    Player.destroy_all

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

    player = JSON.parse(response.body, symbolize_names: true)

    expect(response).not_to be_successful
    expect(response.status).to eq(400)
    expect(player[:message][:error]).to eq("There was an error with your login attempt.")
  end
end
