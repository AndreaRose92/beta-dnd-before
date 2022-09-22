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

        if race
            render json: race
        else
            response = RestClient.get(race_url)
            data = JSON.parse(response)
            race = Race.create(
                name: data["name"],
                url: data["url"],
                ability_score_bonuses: data["ability_bonuses"].map {|ab| "#{ab["ability_score"]["name"]} +#{ab["bonus"]}"}.join(", "),
                size: data["size"],
                languages: data["languages"].pluck("name").join(", "),
                traits: data["traits"].pluck("name").join(", "),
                speed: data["speed"]
                )
            render json: race
        end
    end

    private

    def race_url
        return "#{api_url("/api/races/#{params[:id]}")}"
    end

end
