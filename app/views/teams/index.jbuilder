json.array! @teams do |team|
  json.id team.id
  json.name team.name
  json.conference team.conference
end