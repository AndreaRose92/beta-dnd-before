class SubracesController < ApplicationController

    skip_before_action :authorize

    def index
        render json: Subrace.all
    end

    def show
        race = Subrace.find_by(name: params[:id])
        if race
            render json: race
        else
            response = RestClient.get(api_url("/api/subraces/#{params[:id]}"))
            data = JSON.parse(response)
            parent_race = Race.find_by(name: data["race"]["name"]) 
            race = {
                name: data["name"],
                race_id: parent_race.id,
                url: data["url"],
                ability_score_bonuses: data["ability_bonuses"].map {|ab| "#{ab["ability_score"]["name"]} +#{ab["bonus"]}"}.join(", "),
                traits: data["racial_traits"].pluck("name").join(", ")
            }
            if race.name == "High Elf"
                race.merge(
                    languages: data["language_options"]["from"]["options"].map{|opt| opt["item"]["name"]}.join(", ")
            )
            end
            render json: race
        end
    end

    def create 
        race = Subrace.find_or_create_by(name: params[:id]) do |race|
            response = RestClient.get("http://www.dnd5eapi.co/api/subraces/#{params[:id]}")
            data = JSON.parse(response)
            parent_race = Race.find_by(name: data["race"]["name"])
            race.name = data["name"]
            race.race_id = parent_race.id
            race.url = data["url"]
            race.ability_score_bonuses = data["ability_bonuses"].map {|ab| "#{ab["ability_score"]["name"]} +#{ab["bonus"]}"}.join(", ")
            race.traits = data["racial_traits"].pluck("name").join(", ")
            if race.name == "High Elf"
                race.languages = data["language_options"]["from"]["options"].map{|opt| opt["item"]["name"]}.join(", ")
            end
        end
        render json: race, status: :created
    end

end
