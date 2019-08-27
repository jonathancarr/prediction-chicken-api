class TeamsController < ApplicationController
    before_action :find_tournament

    def index
        @teams = @tournament.teams
    end

    def show
        @team = @tournament.teams.find(params[:id])
    end

    def find_tournament
        @tournament = Tournament.find(params[:tournament_id])
    end
end
