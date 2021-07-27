class ChangePlayerStackRelationship < ActiveRecord::Migration[6.1]
  def change
    remove_reference :player_games, :stack, index: true
    add_reference :stacks, :player, index: true, foreign_key: true
  end
end
