class ClassSpellsController < ApplicationController

    def class_index
        render json: class_fetch
    end

    def level_index
        render json: level_fetch
    end

    # def create
    #     join = ClassSpell.create(dnd_class: find_class, spell: find_spell)
    #     render json: join, status: :created
    # end

    private

    # def find_class
    #     DndClass.find_by(api_index: params[:dnd_class])
    # end

    # def find_spell
    #     Spell.find_by(api_index: params[:spell])
    # end

    def class_fetch
        response = RestClient.get("http://www.dnd5eapi.co/api/classes/#{params[:dnd_class]}/spells")
        data = JSON.parse(response)["results"]
        data
    end

    def level_fetch
        response = RestClient.get("http://www.dnd5eapi.co/api/classes/#{params[:dnd_class]}/levels/#{params[:level]}/spells")
        data = JSON.parse(response)["results"]
        data
    end

end
