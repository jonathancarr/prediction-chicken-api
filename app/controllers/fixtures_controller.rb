class FixturesController < ApplicationController
    before_action :find_tournament

    def index
        @fixtures = @tournament.fixtures
        if fixture_params[:week]
            @fixtures = @fixtures.where(week: fixture_params[:week])
        end
        if fixture_params[:year]
            @fixtures = @fixtures.where("EXTRACT(YEAR FROM kick_off_at) = ?", fixture_params[:year])
        end
    end

    def show
        @fixture = @tournament.fixtures.find(params[:id])
    end

    def find_tournament
        @tournament = Tournament.find(params[:tournament_id])
    end

    def fixture_params
        params.permit(:week, :year)
    end
end
