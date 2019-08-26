require 'open-uri'

class GatherResultsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    @week = 1
    @year = 2019
    scrape_thing
  end

  def scrape_thing()
    doc = Nokogiri::HTML(open("http://www.mitre10cup.co.nz/Fixtures"))
    doc.css("tbody tr").each.with_index do |row|
      row_data = row.css("td").map {|cell| cell.text.strip}
      parse_row(row_data)
  end

  def parse_row(row)
    return if parse_week(row)

    parse_game(row)
  end

  def parse_week(row)
    if row[0] =~ /Week \d+/
      @week = row[0] =~ /\d+/
    end
  end

  def parse_game(row)
    datetime = parse_datetime(row[0], row[3])
    teams = parse_teams(row[1])
    venue = row[2]
    score = parse_score(row[4])
    {
      home_team: teams[:home_team],
      away_team: teams[:away_team],
      kick_off_at: datetime,
      venue: venue,
      home_score: score[:home_score],
      away_score: score[:away_score],
    }
  end

  def parse_datetime(date, time)
    DateTime.strptime("#{date} #{@year} #{time} NZT", "%d %b %Y %l:%M %p %Z")
  end

  def parse_teams(match)
    teams = match.split(" v ")
    { home_team: teams[0], away_team: teams[1] }
    # Todo get team IDs and validate
  end

  def parse_score(score)
    scores = score.split("-")
    { home_score: scores[0], away_score: scores[1] }
  end
end
 