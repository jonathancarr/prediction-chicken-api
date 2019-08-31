json.array! @fixtures do |fixture|
  json.id fixture.id
  json.home_team do
    json.name fixture.home_team.name
    json.primary_color fixture.home_team.primary_color
    json.secondary_color fixture.home_team.secondary_color
  end
  json.away_team do
    json.name fixture.away_team.name
    json.primary_color fixture.away_team.primary_color
    json.secondary_color fixture.away_team.secondary_color
  end
  json.week fixture.week
  json.year fixture.year
  json.kick_off_at fixture.kick_off_at
end