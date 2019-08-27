json.array! @fixtures do |fixture|
  json.id fixture.id
  json.teams "#{fixture.home_team.name} vs #{fixture.away_team.name}"
  json.week fixture.week
  json.year fixture.year
end