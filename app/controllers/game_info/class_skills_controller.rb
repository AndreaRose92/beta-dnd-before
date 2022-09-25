class ClassSkillsController < ApplicationController

    def index
        render json: ClassSkill.all
    end

    def show
        render json: ClassSkill.find(params[:id])
    end

end
