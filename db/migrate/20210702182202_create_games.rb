class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.boolean :active
      t.json :game_summary
      t.integer :turn_counter

      t.timestamps
    end
  end
end
