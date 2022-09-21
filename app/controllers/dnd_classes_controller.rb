class DndClassesController < ApplicationController

    skip_before_action :authorize

    def index
        render json: DndClass.all
    end

    def show
        # response = RestClient.get("#{dnd_class_url}/#{params[:id].downcase}")
        response = RestClient.get("#{api_url(dnd_class_url)}/levels")
        dndclass = JSON.parse(response)
        
        render json: dndclass
    end

    # def show
    #     # byebug
    #     response = RestClient.get(api_url("/api/features"))
    #     data = JSON.parse(response)
    #     render json: data
    # end

    private

    def dnd_class_url
        DndClass.find_by(id: params[:id]).url
    end

end
