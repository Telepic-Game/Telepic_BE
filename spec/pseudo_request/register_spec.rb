require 'rails_helper'

RSpec.describe 'Player authentication', type: :request do
  it 'Player can be registered with permission of 1' do
    Player.destroy_all

    attributes = {
      "email": "example@whatever.com",
      "verify_email": "example@whatever.com",
      "password": "password123",
      "password_digest": "password123"
    }

    post api_v1_register_index_path, params: attributes

    player = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.status).to eq(201)
    expect(player[:data]).to be_a(Hash)
    expect(player[:data].keys).to include(:id)
    expect(player[:data].keys).to include(:type)
    expect(player[:data].keys).to include(:attributes)
    expect(player[:data][:attributes].keys).to include(:email)
    expect(player[:data][:attributes].keys).to include(:player_stories)
    expect(player[:data][:id]).to be_a(String)
    expect(player[:data][:type]).to be_a(String)
    expect(player[:data][:type]).to eq("player")
    expect(player[:data][:attributes][:email]).to eq("example@whatever.com")
    expect(player[:data][:attributes][:email]).to be_a(String)
    expect(player[:data][:attributes][:permissions]).to eq("registered")
  end
  it 'Player will not be registered, when given blank input' do
    Player.destroy_all

    attributes = {
      "email": "",
      "password_digest": "password123",
    }

    post api_v1_register_index_path, params: attributes

    expect(response).not_to be_successful
    expect(response.status).to eq(400)
  end
end
