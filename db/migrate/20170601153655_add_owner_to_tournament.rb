class AddOwnerToTournament < ActiveRecord::Migration
  def change
    add_column :tournaments, :owner, :text
  end
end
