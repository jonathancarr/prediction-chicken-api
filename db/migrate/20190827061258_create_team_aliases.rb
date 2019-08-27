class CreateTeamAliases < ActiveRecord::Migration[5.2]
  def change
    create_table :team_aliases do |t|
      t.references :team, foreign_key: true
      t.string:alias

      t.timestamps
    end
  end
end
