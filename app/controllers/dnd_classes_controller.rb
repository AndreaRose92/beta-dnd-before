class DndClassesController < ApplicationController

    def index
        render json: DndClass.all
    end

    def show
        render json: find_class
    end

    def show_level
        render json: DndClassLevel.find_by(dnd_class: find_class, level: params[:level])
    end

    private

    def find_class
        DndClass.find_by(index: params[:id])
    end
end
