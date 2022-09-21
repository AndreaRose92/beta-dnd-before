class DndClassesController < ApplicationController

    skip_before_action :authorize

    def index
        render json: DndClass.all
    end

    def show
        response = RestClient.get("#{api_url(dnd_class_url)}")
        dndclass = JSON.parse(response)
        render json: dndclass
    end

    private

    def dnd_class_url
        DndClass.find_by(name: params[:id].capitalize).url
    end

end
