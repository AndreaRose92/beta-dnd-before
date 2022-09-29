class ClassSpellsController < ApplicationController

    def class_index
        render json: class_fetch
    end

    def level_index
        render json: level_fetch
    end


    private

    def class_fetch
        response = RestClient.get("#{api_url}/classes/#{params[:dnd_class]}/spells")
        data = JSON.parse(response)["results"]
        data
    end

    def level_fetch
        response = RestClient.get("#{api_url}/classes/#{params[:dnd_class]}/levels/#{params[:level]}/spells")
        data = JSON.parse(response)["results"]
        data
    end

end
