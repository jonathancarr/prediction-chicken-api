class Team < ApplicationRecord
    has_many :team_alias
    has_many :fixture
end
