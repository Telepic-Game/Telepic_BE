require 'rails_helper'

RSpec.describe 'Create Waiting Room', type: :request do
  before :each do
    # db = Api::V1::TestController.new
    # db.destroy_database
    WaitingRoomPlayer.destroy_all
    Player.destroy_all
    WaitingRoom.destroy_all
    @player_1 = Player.create(
      email: 'elonsmusk@gmail.com',
      password_digest: 'word123',
      permissions: 1
    )
    # @player_2 = Player.create(
    #   password_digest: 'guest',
    #   permissions: 0
    # )
    @waiting_room = WaitingRoom.create
    WaitingRoomPlayer.create(
      waiting_room: @waiting_room,
      player: @player_1,
      username: 'elonsmusk',
    )
    @room_code = @waiting_room.room_code
  end
  it 'Can create waiting room with player pemission status changes' do
    attributes = {
      room_code: @room_code,
      username: 'taoistcowboy'
    }

    post api_v1_non_host_join_waiting_room_path, params: attributes

    expected = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.status).to eq(201)
  end
end
