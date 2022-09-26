class RacesController < ApplicationController

    skip_before_action :authorize

    def index
        render json: Race.all
    end

    def show
        if params[:id] == "half-elf"
            race = Race.find_by(name: "Half-Elf")
        elsif params[:id] == "half-orc"
            race = Race.find_by(name: "Half-Orc")
        else
            race = Race.find_by(name: params[:id].capitalize)
        end

    end

    private

    def race_url
        return "#{api_url("/api/races/#{params[:id]}")}"
    end

end
