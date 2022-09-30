class DndClassesController < ApplicationController

    def index
        render json: DndClass.all
    end

    def show
        render json: DndClass.find_by(index: params[:id])
    end
end
