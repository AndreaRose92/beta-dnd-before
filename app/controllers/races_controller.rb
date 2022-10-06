class RacesController < ApplicationController

    skip_before_action :authorize, only: [:index, :show]

    def index
        render json: JSON.parse(RestClient.get("#{api_url}/races"))["results"]
    end

    def show
        race = Race.find_by(index: params[:race])
        if !race
            race = parse_race_data
            race[:subraces] = []
            race[:subraces] << parse_subrace_data
        end
        render json: race
    end

    def create
        race = Race.find_or_create_by(index: params[:race]) do |new_race|
            new_race.update(parse_race_data)
            if race_data["subraces"] != []
                new_subrace = Subrace.create(race: new_race)
                subrace.update(parse_subrace_data)
            end
        end
        render json: race
    end

    private 

    def race_data
        JSON.parse(RestClient.get("#{api_url}/races/#{params[:race]}"))
    end

    def subrace_data
        JSON.parse(RestClient.get("#{api_url}/subraces/#{race_data["subraces"][0]["index"]}"))
    end

    def parse_race_data
        race = {
            name: race_data["name"],
            index: race_data["index"],
            size: race_data["size"],
            speed: race_data["speed"],
            languages: stringify_fetch(race_data["languages"]),
        }
        stats = find_abi(race_data["ability_bonuses"])
        race.merge(stats)
    end

    def parse_subrace_data
        subrace = {
            name: subrace_data["name"],
            index: subrace_data["index"],
            languages: subrace_data["languages"] ? stringify_fetch(subrace_data["languages"]) : nil
        }
        stats = find_abi(subrace_data["ability_bonuses"])
        subrace.merge(stats)
    end
end
