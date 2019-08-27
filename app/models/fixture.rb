class Fixture < ApplicationRecord
  belongs_to :home_team, class_name: "Team"
  belongs_to :away_team, class_name: "Team"
  belongs_to :tournament

  def year
    kick_off_at.year
  end

end
