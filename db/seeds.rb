# Initialise Tournaments

mitre_10_cup = Tournament.create({
    name: "Mitre 10 Cup",
    short_name: "mitre10",
})

# Initialise Mitre 10 Cup teams

tasman = Team.create({
    name: 'Tasman',
    conference: 'Premiership',
    tournament_id: mitre_10_cup.id,
    country: 'New Zealand',
    primary_color: '#EC1946',
    secondary_color: '#0F2C52',
});

auckland = Team.create({
    name: 'Auckland',
    conference: 'Premiership',
    tournament_id: mitre_10_cup.id,
    country: 'New Zealand',
    primary_color: '#0061AE',
    secondary_color: '#FFFFFF',
});

waikato = Team.create({
    name: 'Waikato',
    conference: 'Premiership',
    tournament_id: mitre_10_cup.id,
    country: 'New Zealand',
    primary_color: '#FED813',
    secondary_color: '#E40001',
});

north_harbour = Team.create({
    name: 'North Harbour',
    conference: 'Premiership',
    tournament_id: mitre_10_cup.id,
    country: 'New Zealand',
    primary_color: '#A51D35',
    secondary_color: '#FFFFFF',
});
north_harbour.team_alias.create({alias: 'North harbour'})

counties_manukau = Team.create({
    name: 'Counties Manukau',
    conference: 'Premiership',
    tournament_id: mitre_10_cup.id,
    country: 'New Zealand',
    primary_color: '#E00034',
    secondary_color: '#221E1F',
});
counties_manukau.team_alias.create([{alias: 'Counties-Manukau'}, {alias: 'Counties Man'}])

wellington = Team.create({
    name: 'Wellington',
    conference: 'Premiership',
    tournament_id: mitre_10_cup.id,
    country: 'New Zealand',
    primary_color: '#FFC20F',
    secondary_color: '#000000',
});

canterbury = Team.create({
    name: 'Canterbury',
    conference: 'Premiership',
    tournament_id: mitre_10_cup.id,
    country: 'New Zealand',
    primary_color: '#DA251C',
    secondary_color: '#000000',
});

taranaki = Team.create({
    name: 'Taranaki',
    conference: 'Championship',
    tournament_id: mitre_10_cup.id,
    country: 'New Zealand',
    primary_color: '#FDC115',
    secondary_color: '#171516',
});

hawkes_bay = Team.create({
    name: 'Hawke\'s Bay',
    conference: 'Championship',
    tournament_id: mitre_10_cup.id,
    country: 'New Zealand',
    primary_color: '#010101',
    secondary_color: '#FFFFFF',
});
hawkes_bay.team_alias.create({alias: 'Hawke’s Bay'})

bay_of_plenty = Team.create({
    name: 'Bay of Plenty',
    conference: 'Championship',
    tournament_id: mitre_10_cup.id,
    country: 'New Zealand',
    primary_color: '#29488A',
    secondary_color: '#F7C01E',
});

otago = Team.create({
    name: 'Otago',
    conference: 'Championship',
    tournament_id: mitre_10_cup.id,
    country: 'New Zealand',
    primary_color: '#0157A0',
    secondary_color: '#FFCA08',
});

northland = Team.create({
    name: 'Northland',
    conference: 'Championship',
    tournament_id: mitre_10_cup.id,
    country: 'New Zealand',
    primary_color: '#89B9E3',
    secondary_color: '#FFFFFF',
});

manawatu = Team.create({
    name: 'Manawatu',
    conference: 'Championship',
    tournament_id: mitre_10_cup.id,
    country: 'New Zealand',
    primary_color: '#00A361',
    secondary_color: '#FFFFFF',
});

southland = Team.create({
    name: 'Southland',
    conference: 'Championship',
    tournament_id: mitre_10_cup.id,
    country: 'New Zealand',
    primary_color: '#5D001D',
    secondary_color: '#FED404',
});