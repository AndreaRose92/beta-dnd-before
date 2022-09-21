class FightersController < ApplicationController
    def index
        render json: Fighter.all
    end

    def show
        level = Fighter.find_by(level: params[:id])
        if level
            render json: level
        else
            response = RestClient.get(api_url(fighter_url))
            data = JSON.parse(response)
            new_level = Fighter.create(
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

    def fighter_url 
        return "/api/classes/fighter/levels/#{params[:id]}"
    end
end
