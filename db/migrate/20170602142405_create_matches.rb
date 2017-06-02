class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.references :tournament, index: true, foreign_key: true
      t.string :player1
      t.string :player2
      t.boolean :complete
      t.string :winner
      t.string :final_score

      t.timestamps null: false
    end
  end
end
