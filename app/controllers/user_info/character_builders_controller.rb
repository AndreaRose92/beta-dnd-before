class CharacterBuildersController < ApplicationController

    def create
        new_char = CharacterBuilder.create!(builder_params)
        render json: new_char
    end


    private
    
    def builder_params
        params.permit(:dnd_class_id, :race_id, :level)
    end


end
