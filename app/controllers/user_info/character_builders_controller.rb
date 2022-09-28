class CharacterBuildersController < ApplicationController

    def create
        new_char = CharacterBuilder.create!(builder_params)
        render json: new_char
    end

    def update
        new_char = CharacterBuilder.find(params[:id])
    end

    def destroy
        CharacterBuilder.find(params[:id]).destroy
        head :no_content
    end

    private
    
    def builder_params
        params.permit(:dnd_class_id, :race_id, :level, :id)
    end


end
