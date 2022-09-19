class DndClassesController < ApplicationController

    skip_before_action :authorize

    def index
        render json: DndClass.all
    end

    def show
        response = RestClient.get("#{dnd_class_url}/#{params[:id].downcase}")
        dndclass = JSON.parse(response)
        render json: dndclass
    end

    private

    def dnd_class_url
        return "#{api_url("/api/classes")}"
    end

end
