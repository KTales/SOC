class AddOwnerToTournament < ActiveRecord::Migration
  def change
    add_column :tournaments, :owner_id, :text
  end
end
