class SubracesController < ApplicationController

    skip_before_action :authorize

    def show
        race = Subrace.find_by(api_index: params[:subrace])
        if !race
            race = parse_subrace_fetch
        end
        render json: race
    end

    def create 
        race = Subrace.find_or_create_by(race: find_race) do |race|
            race.update(parse_subrace_fetch)
        end
        render json: race
    end

    private

    def fetch_data
        JSON.parse(RestClient.get("http://www.dnd5eapi.co/api/subraces/#{params[:subrace]}"))
    end

    def find_race
        Race.find_by(api_index: params[:race])
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
