class CreateSlackCommands < ActiveRecord::Migration
  def change
    create_table :slack_commands do |t|
      t.string :command
      t.string :token
      t.string :controller
      t.string :action
      t.boolean :allow_blank
      t.boolean :managers_only
      t.timestamps
    end
  end
end
