class CreatePlayers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.json :user_stories

      t.timestamps
    end
  end
end
