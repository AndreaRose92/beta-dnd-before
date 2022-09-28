class CharacterBuildersController < ApplicationController

    def create
        new_char = CharacterBuilder.create!(builder_params)
        render json: new_char
    end

    def update
        new_char = CharacterBuilder.find(params[:id])
        new_char.update!(builder_params)
    end

    def destroy
        CharacterBuilder.destroy_all
        CharacterBuilder.reset_pk_sequence
        head :no_content
    end

    private
    
    def builder_params
        params.permit(:dnd_class_id, :race_id, :level, :id)
    end


end
