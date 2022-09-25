class ProficienciesController < ApplicationController

    def index
        render json: Proficiency.all
    end

    def show
        render json: Proficiency.find(params[:id])
    end

end
