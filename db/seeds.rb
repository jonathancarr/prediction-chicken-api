# Initialise Mitre 10 Cup teams

tasman = Team.create({
    name: 'Tasman',
    conference: 'Premiership',
    tournament: 'Mitre 10 Cup',
    country: 'New Zealand',
});

auckland = Team.create({
    name: 'Auckland',
    conference: 'Premiership',
    tournament: 'Mitre 10 Cup',
    country: 'New Zealand',
});

waikato = Team.create({
    name: 'Waikato',
    conference: 'Premiership',
    tournament: 'Mitre 10 Cup',
    country: 'New Zealand',
});

north_harbour = Team.create({
    name: 'North Harbour',
    conference: 'Premiership',
    tournament: 'Mitre 10 Cup',
    country: 'New Zealand',
});
north_harbour.team_alias.create({alias: 'North harbour'})

counties_manukau = Team.create({
    name: 'Counties Manukau',
    conference: 'Premiership',
    tournament: 'Mitre 10 Cup',
    country: 'New Zealand',
});
counties_manukau.team_alias.create([{alias: 'Counties-Manukau'}, {alias: 'Counties Man'}])


wellington = Team.create({
    name: 'Wellington',
    conference: 'Premiership',
    tournament: 'Mitre 10 Cup',
    country: 'New Zealand',
});

canterbury = Team.create({
    name: 'Canterbury',
    conference: 'Premiership',
    tournament: 'Mitre 10 Cup',
    country: 'New Zealand',
});

taranaki = Team.create({
    name: 'Taranaki',
    conference: 'Championship',
    tournament: 'Mitre 10 Cup',
    country: 'New Zealand',
});

hawkes_bay = Team.create({
    name: 'Hawke\'s Bay',
    conference: 'Championship',
    tournament: 'Mitre 10 Cup',
    country: 'New Zealand',
});
hawkes_bay.team_alias.create({alias: 'Hawke’s Bay'})

bay_of_plenty = Team.create({
    name: 'Bay of Plenty',
    conference: 'Championship',
    tournament: 'Mitre 10 Cup',
    country: 'New Zealand',
});

otago = Team.create({
    name: 'Otago',
    conference: 'Championship',
    tournament: 'Mitre 10 Cup',
    country: 'New Zealand',
});

northland = Team.create({
    name: 'Northland',
    conference: 'Championship',
    tournament: 'Mitre 10 Cup',
    country: 'New Zealand',
});

manawatu = Team.create({
    name: 'Manawatu',
    conference: 'Championship',
    tournament: 'Mitre 10 Cup',
    country: 'New Zealand',
});

southland = Team.create({
    name: 'Southland',
    conference: 'Championship',
    tournament: 'Mitre 10 Cup',
    country: 'New Zealand',
});