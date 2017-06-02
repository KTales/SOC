class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.references :tournament, index: true, foreign_key: true
      t.string :name
      t.integer :wins
      t.integer :losses

      t.timestamps null: false
    end
  end
end
