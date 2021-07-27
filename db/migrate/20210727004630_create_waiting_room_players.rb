class CreateWaitingRoomPlayers < ActiveRecord::Migration[6.1]
  def change
    create_table :waiting_room_players do |t|
      t.references :waiting_room, null: false, foreign_key: true
      t.references :player, null: false, foreign_key: true

      t.timestamps
    end
  end
end
