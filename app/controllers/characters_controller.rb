class CharactersController < ApplicationController

    def index
        render json: Character.where(user_id: current_user.id)
    end

    def show
        render json: find_character
    end

    def create
        skills = params[:proficiencies]
        char = Character.create!(
            name: params[:name],
            level: params[:level],
            user_id: params[:user_id],
            dnd_class_id: params[:dnd_class_id],
            race_id: params[:race_id],
            Strength: params[:Strength],
            Dexterity: params[:Dexterity],
            Constitution: params[:Constitution],
            Intelligence: params[:Intelligence],
            Wisdom: params[:Wisdom],
            Charisma: params[:Charisma],
            hp: params[:hp],
            current_hp: params[:current_hp]
        )
        render json: char, status: :created
    end

    def update
        char = find_character
        char.update!(char_params)
        render json: char, status: :accepted
    end

    def destroy
        find_character.destroy
        head :no_content
    end

    private

    def find_character
        Character.find(params[:id])
    end

    def char_params
        params.require(:character).permit(:name, :level, :user_id, :dnd_class_id, :race_id, :Strength, :Dexterity, :Constitution, :Intelligence, :Wisdom, :Charisma, :hp, :current_hp, :proficiencies)
    end

    # def skill_params
    #     params.permit(:proficiencies)
    # end
end
