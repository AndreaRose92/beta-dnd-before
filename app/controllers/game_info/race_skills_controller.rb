class RaceSkillsController < ApplicationController

    def index
        render json: RaceSkill.all
    end

    def show
        render json: RaceSkill.find(params[:id])
    end

end
