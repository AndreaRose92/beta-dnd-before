class ClericsController < ApplicationController
    def index
        render json: Cleric.all
    end

    def show
        level = Cleric.find_by(level: params[:id])
        if level
            render json: level
        else
            response = RestClient.get(api_url(cleric_url))
            data = JSON.parse(response)
            new_level = Cleric.create(
                level: data["level"],
                prof_bonus: data["prof_bonus"],
                features: data["features"].pluck("name").join(", "),
                class_specific: data["class_specific"].map {
                    |k,v| "#{k}: #{v}"
                }.join(', '),
                abi: data["ability_score_bonuses"],
            )
            render json: new_level
        end
    end

    private

    def cleric_url 
        return "/api/classes/cleric/levels/#{params[:id]}"
    end
end
