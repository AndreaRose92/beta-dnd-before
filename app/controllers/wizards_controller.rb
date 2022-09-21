class WizardsController < ApplicationController
    def index
        render json: Wizard.all
    end

    def show
        level = Wizard.find_by(level: params[:id])
        if level
            render json: level
        else
            response = RestClient.get(api_url(wizard_url))
            data = JSON.parse(response)
            new_level = Wizard.create(
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

    def wizard_url 
        return "/api/classes/wizard/levels/#{params[:id]}"
    end
end
