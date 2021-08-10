require 'rails_helper'

RSpec.describe 'As a host, Inactive Game and Player Game are created when waiting room is made', type: :request do
  before :each do
    WaitingRoomPlayer.destroy_all
    Player.destroy_all
    WaitingRoom.destroy_all
    PlayerGame.destroy_all
    Game.destroy_all

    @player_1 = Player.create(
      email: 'elonsmusk@gmail.com',
      password_digest: 'word123',
      permissions: 2,
    )
  end
  it 'Can create waiting room with player pemission status changes' do
    attributes = {
      email: 'elonsmusk@gmail.com'
    }

    post api_v1_open_waiting_room_path, params: attributes

    expected = JSON.parse(response.body, symbolize_names: true)
    require 'pry'; binding.pry
    expect(response).to be_successful
    expect(response.status).to eq(201)
  end
end
