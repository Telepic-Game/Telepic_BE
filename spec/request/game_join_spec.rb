require 'rails_helper'

RSpec.describe 'As a non-host joining a game', type: :request do
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
    @player_2 = Player.create(
      email: 'taoistcowboy@gmail.com',
      password_digest: 'testtest',
      permissions: 1,
    )
    @waiting_room = WaitingRoom.create
    WaitingRoomPlayer.create(
      waiting_room: @waiting_room,
      player: @player_1,
      username: 'elonsmusk',
    )
    @room_code = @waiting_room.room_code
    @game = Game.create(
      turn_counter: 2,
    )
    PlayerGame.create(
      game_id: @game.id,
      player_id: @player_1.id,
      username: 'elonsmusk',
    )
  end
  it 'As a guest, player game is created for the correct game via room code' do
    attributes = {
      room_code: @room_code,
      username: 'somebody_people',
    }

    post api_v1_non_host_join_waiting_room_path, params: attributes

    expected = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.status).to eq(201)
    expect(expected.dig(:data, :attributes).keys).to include(:game)
    expect(expected.dig(:data, :attributes).keys).to include(:player_game)
    expect(expected.dig(:data, :attributes, :player_game, :username)).to eq('somebody_people')
  end
  it 'As a registered player, player game is created for the correct game via room code' do
    attributes = {
      email: @player_2.email,
      room_code: @room_code,
      username: 'taoistcowboy',
    }

    post api_v1_non_host_join_waiting_room_path, params: attributes

    expected = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.status).to eq(201)
    expect(expected.dig(:data, :attributes).keys).to include(:game)
    expect(expected.dig(:data, :attributes).keys).to include(:player_game)
    expect(expected.dig(:data, :attributes, :player_game, :username)).to eq('taoistcowboy')
  end
end
