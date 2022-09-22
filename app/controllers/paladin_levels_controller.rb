class PaladinLevelsController < ApplicationController

    skip_before_action :authorize

    def index
        response = RestClient.get(api_url(paladin_url))
        data = JSON.parse(response)
        render json: data
    end

    def show
        level = PaladinLevel.find_by(level: params[:id])
        if level
            render json: level
        else
            response = RestClient.get(api_url(paladin_url))
            data = JSON.parse(response)
            new_level = PaladinLevel.create(
                level: data["level"],
                prof_bonus: data["prof_bonus"],
                features: data["features"].pluck("name").join(", "),
                class_specific: data["class_specific"].map {
                    |k,v| "#{k}: #{v}"
                }.join(', '),
                ability_score_bonuses: data["ability_score_bonuses"],
                dnd_class_id: DndClass.find_by(name: "Paladin").id
            )
            render json: new_level
        end
    end

    private

    def paladin_url 
        return "/api/classes/paladin/levels/#{params[:id]}"
    end
end
