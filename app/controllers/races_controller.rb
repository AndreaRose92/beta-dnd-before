class RacesController < ApplicationController

    skip_before_action :authorize

    def index
        render json: Race.all
    end

    def show
        race = Race.find_by(name: params[:id].capitalize)
        render json: race
    end

    private

    def race_url
        return "#{api_url("/api/races")}"
    end

end
