class CharSkillsController < ApplicationController

    def show
        render json: CharSkill.where(character_id: params[:id])
    end

    def create

        char = Character.find_by(name: params[:character])
        skill = Proficiency.find_by(name: params[:proficiency])
        new_skill = CharSkill.create!(character_id: char.id, proficiency_id: skill.id)
        # skill = CharSkill.create!(character_id: Character.find_by(name: params[:character]), proficiency_id: Proficiency.find_by(name: params[:proficiency]).id)
        render json: new_skill, status: :created
    end

    def destroy
        CharSkill.find_by(character_id: Character.find_by(name: params[:character]).id, proficiency_id: Proficiency.find_by(name: params[:proficiency]).id).destroy
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