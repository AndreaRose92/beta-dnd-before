class CharSkillsController < ApplicationController

    def show
        render json: CharSkill.where(character_id: params[:id])
    end

    # def show
    #     render json: CharSkill.find_by(character_id: params[:character_id], proficiency_id: Proficiency.find_by(name: params[:proficiency]))
    # end

    def create
        skill = CharSkill.create!(character_id: params[:character_id], proficiency_id: Proficiency.find_by(name: params[:proficiency]).id)
        render json: skill, status: :created
    end

    def destroy
        CharSkill.find_by(character_id: params[:character_id], proficiency_id: Proficiency.find_by(name: params[:proficiency]).id).destroy
        head :no_content
    end

    private

    # def skill_params
    #     params.permit(:character_id, :proficiency_id)
    # end

    # def find_skill
    #     CharSkill.find_by(skill_params)
    # end
end