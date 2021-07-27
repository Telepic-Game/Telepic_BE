class CreateWaitingRoom < ActiveRecord::Migration[6.1]
  def change
    create_table :waiting_rooms do |t|
      t.string :room_code

      t.timestamps
    end
  end
end
