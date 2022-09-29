class CharacterBuildersController < ApplicationController

    def create
       if find_class && find_race
        new_char == CharacterBuilder.create!(builder_params)
       elsif find_class
        race = JSON.parse(RestClient.get("#{api_url}/races/#{params[:race]}")).name
        new_char = CharacterBuilder.create!(
            dnd_class: find_class,
            race_name: race,
            level: params[:level]
        )
       end
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
        params.permit(:dnd_class, :race, :level, :id)
    end

    def find_class
        DndClass.find_by(api_index: params[:dnd_class])
    end
    def find_race
        Race.find_by(api_index: params[:race])
    end

end
