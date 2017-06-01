class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.references :tournament, index: true, foreign_key: true
      t.string :tournament
      t.string :name
      t.string :slack_id
      t.integer :wins
      t.integer :losses
      t.integer :total_score

      t.timestamps null: false
    end
  end
end
