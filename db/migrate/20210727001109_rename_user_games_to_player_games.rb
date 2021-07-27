class RenameUserGamesToPlayerGames < ActiveRecord::Migration[6.1]
  def change
    rename_table :user_games, :player_games
    rename_column :player_games, :user_id, :player_id
    rename_column :player_games, :user_story, :player_story
    rename_column :players, :user_stories, :player_stories
    add_column :players, :permissions, :integer
  end
end
