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
      email: 'elonsmusk@gmail.com',
      username: 'elonsmusk',
    }

    post api_v1_open_waiting_room_path, params: attributes

    expected = JSON.parse(response.body, symbolize_names: true)
    expect(response).to be_successful
    expect(response.status).to eq(201)
    expect(expected.dig(:data, :attributes, :game, :active)).to eq(false)
    expect(expected.dig(:data, :attributes, :game, :turn_counter)).to eq(2)
    expect(expected.dig(:data, :attributes, :player_game, :game_id)).to eq(expected.dig(:data, :attributes, :game, :id))
    expect(expected.dig(:data, :attributes, :player_game, :player_id)).to eq(expected.dig(:data, :attributes, :player, :id))
  end
end
