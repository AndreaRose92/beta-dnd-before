class EquipmentController < ApplicationController

    def index
        render json: Equipment.all
    end

    def show
        item = Equipment.find_or_create_by(name: params[:id])
    end

end
