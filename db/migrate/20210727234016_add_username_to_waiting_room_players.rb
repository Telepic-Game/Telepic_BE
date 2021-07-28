class AddUsernameToWaitingRoomPlayers < ActiveRecord::Migration[6.1]
  def change
    add_column :waiting_room_players, :username, :string
  end
end
