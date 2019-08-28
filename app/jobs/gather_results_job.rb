require 'open-uri'

class GatherResultsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    @tournament = Tournament.find_by(short_name: "mitre10")
    results_urls = [
      { year: 2016, url: "http://www.mitre10cup.co.nz/Fixtures/Index/Mitre2016" },
      { year: 2017, url: "http://www.mitre10cup.co.nz/Fixtures/Index/Mitre2017" },
      { year: 2018, url: "http://www.mitre10cup.co.nz/Fixtures/Index/Mitre2018" },
      { year: 2019, url: "http://www.mitre10cup.co.nz/Fixtures" },
    ]
    fixtures = results_urls.collect do |results| 
      @year = results[:year]
      @week = 1
      scrape_results(results[:url])
    end.flatten()
    update_games(fixtures)
  end

  def scrape_results(url)
    doc = Nokogiri::HTML(open(url))
    fixtures = doc.css("tbody tr").map do |row|
      row_data = row.css("td").map {|cell| cell.text.strip}
      parse_row(row_data)
    end.select(&:present?)
    set_playoff_weeks(fixtures)
  end

  def parse_row(row)
    if row.count == 1
      parse_week(row[0])
      return nil
    end

    parse_game(row)
  end
  
  def parse_week(str)
    if str =~ /semi/i
      @week = :semifinals
    elsif str =~ /final/i
      @week = :finals
    elsif str =~ /Week \d+/
      week = str.match(/\d+/)[0].to_i
      @week = week
    end
  end

  def parse_game(row)
    begin
      datetime = parse_datetime(row[0], row[3])
      teams = parse_teams(row[1])
      venue = row[2]
      score = parse_score(row[4])
      {
        week: @week,
        home_team_id: teams[:home_team_id],
        away_team_id: teams[:away_team_id],
        kick_off_at: datetime,
        venue: venue,
        home_score: score[:home_score],
        away_score: score[:away_score],
        tournament_id: @tournament.id,
      }
    rescue Exception => e
      puts "Cannot parse match: #{row.inspect}"
    end
  end

  def parse_datetime(date, time)
    DateTime.strptime("#{date} #{@year} #{time} NZT", "%d %b %Y %l:%M %p %Z")
  end

  def parse_teams(match)
    teams = match.split(" v ")
    { home_team_id: team_id(teams[0]), away_team_id: team_id(teams[1]) }
  end

  def team_id(name)
    name = strip_metadata(name)

    team = Team.find_by(name: name)
    return team.id if team.present?
    
    # Team spelling/punctuation can vary across years' results
    team_alias = TeamAlias.find_by(alias: name)
    return team_alias.team.id if team_alias.present?

    raise "Cannot find team: #{name}"
  end

  def strip_metadata(name)
    # Bracketed metadata can be appended to matches to show Ranfurly Shield challenges, etc.
    index = name =~ / \(.*\)/
    name = name[0..index].strip if index

    # Games can be prefixed with playoffs information, eg "Final: Wellington v Auckland"
    index = name =~ /:/
    name = name[(index + 1)..-1].strip if index

    name
  end

  def parse_score(score)
    scores = score.split("-")
    { home_score: scores[0].to_i, away_score: scores[1].to_i }
  end
  
  def set_playoff_weeks(fixtures)
    last_regular_week = fixtures.pluck(:week).select{ |week| week.is_a? Numeric}.max
    fixtures.map do |fixture|
      fixture[:week] = last_regular_week + 1 if fixture[:week] == :semifinals
      fixture[:week] = last_regular_week + 2 if fixture[:week] == :finals
      fixture
    end
  end

  def update_games(fixtures)
    fixtures.each do |fixture|
      game = Fixture.find_or_initialize_by(
        home_team_id: fixture[:home_team_id],
        away_team_id: fixture[:away_team_id],
        kick_off_at: fixture[:kick_off_at],
      )
      game.update_attributes(fixture)
      game.save
    end
  end

end
