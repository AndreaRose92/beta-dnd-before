class CharSkillsController < ApplicationController

    def index
        render json: CharSkill.all
    end

    def show
        render json: CharSkill.find(params[:id])
    end

    def create
        render json: CharSkill.create(user_id: current_user.id, proficiency_id: Proficiency.find_by(params[:proficiency]).id)
    end

    def destroy
        cs = CharSkill.find_by(user_id: current_user.id, proficiency_id: Proficiency.find_by(params[:proficiency]).id)
        cs.destroy
        head :no_content
    end

end
