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
            race = Subrace.create(
                name: data["name"],
                race_id: parent_race.id,
                url: data["url"],
                ability_score_bonuses: data["ability_bonuses"].map {|ab| "#{ab["ability_score"]["name"]} +#{ab["bonus"]}"}.join(", "),
                traits: data["racial_traits"].pluck("name").join(", ")
            )
            if race.name == "High Elf"
                race.update(
                    languages: data["language_options"]["from"]["options"].map{|opt| opt["item"]["name"]}.join(", "),
            )
            end
            render json: race
        end
    end

end
