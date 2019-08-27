class AddTournamentToTeams < ActiveRecord::Migration[5.2]
  def change
    remove_column :teams, :tournament
    add_reference :teams, :tournament, foreign_key: true
  end
end
