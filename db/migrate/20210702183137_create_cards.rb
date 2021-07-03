class CreateCards < ActiveRecord::Migration[6.1]
  def change
    create_table :cards do |t|
      t.references :stack, null: false, foreign_key: true
      t.json :image
      t.string :name

      t.timestamps
    end
  end
end
