class WizardLevelsController < ApplicationController

    skip_before_action :authorize

    def index
        response = RestClient.get(api_url(wizard_url))
        data = JSON.parse(response)
        render json: data
    end

    def show
        level = WizardLevel.find_by(level: params[:id])
        if level
            render json: level
        else
            response = RestClient.get(api_url(wizard_url))
            data = JSON.parse(response)
            new_level = WizardLevel.create(
                level: data["level"],
                prof_bonus: data["prof_bonus"],
                features: data["features"].pluck("name").join(", "),
                class_specific: data["class_specific"].map {
                    |k,v| "#{k}: #{v}"
                }.join(', '),
                ability_score_bonuses: data["ability_score_bonuses"],
                dnd_class_id: DndClass.find_by(name: "Wizard").id
            )
            render json: new_level
        end
    end

    private

    def wizard_url 
        return "/api/classes/wizard/levels/#{params[:id]}"
    end
end
