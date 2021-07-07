require 'rails_helper'

RSpec.describe 'User', type: :request do
  it 'User can be registered' do
    User.destroy_all
    attributes = {
      "email": "example@whatever.com",
      "password_digest": "password123",
    }
    post api_v1_register_index_path, params: attributes

    expect(response).to be_successful
    expect(response.status).to eq(201)
  end
end
