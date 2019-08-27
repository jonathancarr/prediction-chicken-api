class CreateFixtures < ActiveRecord::Migration[5.2]
  def change
    create_table :fixtures do |t|
      t.integer :home_team_id
      t.integer :away_team_id
      t.references :tournament, foreign_key: true
      t.integer :week
      t.datetime :kick_off_at
      t.string :venue
      t.integer :home_score
      t.integer :away_score

      t.timestamps
    end
  end
end
