require 'rails_helper'

RSpec.describe 'User authentication', type: :request do
  it 'User can be registered' do
    User.destroy_all
    attributes = {
      "email": "example@whatever.com",
      "password": "password123",
      "password_digest": "password123"
      }

    post api_v1_register_index_path, params: attributes

    user = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.status).to eq(201)
    expect(user[:data]).to be_a(Hash)
    expect(user[:data].keys).to include(:id)
    expect(user[:data].keys).to include(:type)
    expect(user[:data].keys).to include(:attributes)
    expect(user[:data][:attributes].keys).to include(:email)
    expect(user[:data][:attributes].keys).to include(:user_stories)
    expect(user[:data][:id]).to be_a(String)
    expect(user[:data][:type]).to be_a(String)
    expect(user[:data][:type]).to eq("user")
    expect(user[:data][:attributes][:email]).to eq("example@whatever.com")
    expect(user[:data][:attributes][:email]).to be_a(String)
  end
  it 'User will not be registered, when given blank input' do
    User.destroy_all
    attributes = {
      "email": "",
      "password_digest": "password123",
    }
    post api_v1_register_index_path, params: attributes

    expect(response).not_to be_successful
    expect(response.status).to eq(400)
  end
end
