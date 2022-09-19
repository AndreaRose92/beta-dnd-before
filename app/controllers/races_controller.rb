class RacesController < ApplicationController

    skip_before_action :authorize

    def index
        render json: Race.all
    end

    def show
        # byebug
        response = RestClient.get("#{race_url}/#{params[:id].downcase}")
        race = JSON.parse(response)
        render json: race
    end

    private

    def race_url
        return "#{api_url("/api/races")}"
    end

end
