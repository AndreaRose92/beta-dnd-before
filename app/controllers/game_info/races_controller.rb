class RacesController < ApplicationController

    skip_before_action :authorize, only: [:index, :show]

    def index
        render json: JSON.parse(RestClient.get("http://www.dnd5eapi.co/api/races"))["results"]
    end

    def show
        race = Race.find_by(api_index: params[:race])
        if !race
            race = parse_race_fetch
        end
        render json: race
    end

    def create
        race = Race.find_or_create_by(api_index: params[:race]) do |race|
            race.update(parse_race_fetch)
        end
        # if fetch_data["subraces"][0]
        #     subrace = Subrace.find_or_create_by(race_id: race.id) do |subrace|
        #         subrace_data = JSON.parse(RestClient.get("http://www.dnd5eapi.co/api/subraces/#{fetch_data["subraces"][0]["index"]}"))
        #         subrace.update(parse_subrace_fetch)
        #     end
        # end
        render json: race
    end

    private

    def fetch_data
        response = RestClient.get("http://www.dnd5eapi.co/api/races/#{params[:race]}")
        data = JSON.parse(response)
        data
    end

    def parse_race_fetch
        race_data = {
            name: fetch_data["name"],
            api_index: fetch_data["index"],
            url: fetch_data["url"],
            size: fetch_data["size"],
            speed: fetch_data["speed"],
            languages: stringify_fetch(fetch_data["languages"]),
            traits: stringify_fetch(fetch_data["traits"]),
        }
        stats = find_abi(fetch_data["ability_bonuses"])
        race_data.merge(stats)
    end

    def parse_subrace_fetch data
        subrace_data = {
            name: data["name"],
            url: data["url"],
            api_index: data["index"],
            traits: stringify_fetch(data["racial_traits"])
        }
        stats = find_abi(fetch_data["ability_bonuses"])
        subrace_data.merge(stats)
        subrace_data
    end

end
