class CharSpellsController < ApplicationController

    def index
        render json: CharSpell.where(character_id: params[:character_id])
    end

    def show
        render json: CharSpell.find_by(join_params)
    end

    def create
        join = CharSpell.create!(join_params)
        render json: join, status: :created
    end

    private

    def char
        Character.find_by(name: params[:character_name])
    end

    def spell
        Spell.find_by(name: params[:spell_name])
    end

    def join_params
        params.permit(:character_name, :spell_name)
    end
end
