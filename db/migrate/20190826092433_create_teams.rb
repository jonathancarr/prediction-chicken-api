class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :conference
      t.string :tournament
      t.string :country

      t.timestamps
    end
  end
end
