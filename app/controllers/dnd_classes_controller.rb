class DndClassesController < ApplicationController

    def index
        data = []
        DndClass.all.each do |dc|
            resp = RestClient.get(api_url(dc[:url])) 
            data << JSON.parse(resp)
        end
        render json: data
    end

end
