class BarbariansController < ApplicationController
    def index
        render json: Barbarian.all
    end

    def show
        level = Barbarian.find_by(level: params[:id])
        if level
            render json: level
        else
            response = RestClient.get(api_url(barbarian_url))
            data = JSON.parse(response)
            new_level = Barbarian.create(
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

    def barbarian_url 
        return "/api/classes/barbarian/levels/#{params[:id]}"
    end

end

