class DndClassesController < ApplicationController

    skip_before_action :authorize

    def index
        render json: DndClass.all
    end

    def show
        dc = DndClass.find_by(name: params[:id].capitalize)
        render json: dc
    end

    def proficiencies
        # byebug
        skills = DndClass.find(params[:dnd_class]).proficiencies
        render json: skills
    end

    private

    def dnd_class_url
        DndClass.find_by(name: params[:id].capitalize).url
    end

end
