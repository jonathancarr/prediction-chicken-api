class FixturesController < ApplicationController
    before_action :find_tournament

    def index
        @fixtures = @tournament.fixtures
    end

    def show
        @fixture = @tournament.fixtures.find(params[:id])
    end

    def find_tournament
        @tournament = Tournament.find(params[:tournament_id])
    end
end
