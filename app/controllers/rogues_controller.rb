class RoguesController < ApplicationController
    def index
        render json: Rogue.all
    end

    def show
        level = Rogue.find_by(level: params[:id])
        if level
            render json: level
        else
            response = RestClient.get(api_url(rogue_url))
            data = JSON.parse(response)
            new_level = Rogue.create(
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

    def rogue_url 
        return "/api/classes/rogue/levels/#{params[:id]}"
    end
end
