class WeeksController < ApplicationController
    before_action :find_tournament
    before_action :find_fixtures

    def show
        @week = params[:id].to_i
        @prev_week = @week - 1 if @week > 1
        @next_week = @week + 1 if Fixture.select do |f|
            f.kick_off_at.year == params[:year].to_i && f.week == @week + 1
        end.present?
        
    end

    def find_tournament
        @tournament = Tournament.find(params[:tournament_id])
    end
    
    def find_fixtures
        @fixtures = @tournament.fixtures.select do |f|
            f.kick_off_at.year == params[:year].to_i && f.week == params[:id].to_i
        end.sort_by(&:kick_off_at)
    end
end