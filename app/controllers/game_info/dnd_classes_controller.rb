class DndClassesController < ApplicationController

     skip_before_action :authorize

     def index
          render json: DndClass.all
     end

     def show
          dc = DndClass.find_by(name: params[:id].capitalize)
          render json: dc
     end

     def proficiencies
          amount = DndClass.find(params[:dnd_class]).starting_proficiencies
          skills = DndClass.find(params[:dnd_class]).proficiencies
          data = [skills, amount]
          render json: data
     end

     private



     def max_spell_level spellcasting_level
          if spellcasting_level.lvl_9 > 0
               return 9
          elsif spellcasting_level.lvl_8 > 0
               return 8
          elsif spellcasting_level.lvl_7 > 0
               return 7
          elsif spellcasting_level.lvl_6 > 0
               return 6
          elsif spellcasting_level.lvl_5 > 0
               return 5
          elsif spellcasting_level.lvl_4 > 0
               return 4
          elsif spellcasting_level.lvl_3 > 0
               return 3
          elsif spellcasting_level.lvl_2 > 0
               return 2
          elsif spellcasting_level.lvl_1 > 0
               return 1
          end
     end

end
