class CharactersController < ApplicationController

    def index
        render json: Character.where(user_id: current_user.id)
    end

    def show
        render json: find_character
    end

    def create
        char = Character.create!(char_params)
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
        params.permit(:name, :user_id, :dnd_class_id, :race_id, :strength, :dexterity, :constitution, :intelligence, :wisdom, :charisma, :hp, :current_hp)
    end
end
