class DndClassLevelsController < ApplicationController
    
     skip_before_action :authorize

     def index
          render json: DndClassLevel.where(dnd_class_id: find_class_id)
     end

     def show
          level = find_level
          if level
               render json: level
          else
               response = RestClient.get(api_url("/api/classes/#{params[:dnd_class]}/levels/#{params[:level_id]}"))
               data = JSON.parse(response)
               new_level = DndClassLevel.create(
                    level: data["level"],
                    prof_bonus: data["prof_bonus"],
                    features: data["features"].pluck("name").join(", "),
                    class_specific: data["class_specific"].map{|k,v| "#{k}: #{v}"}.join(', '),
                    ability_score_bonuses: data["ability_score_bonuses"],
                    dnd_class_id: DndClass.find_by(name: params[:dnd_class]).id
               )
               render json: new_level
          end
     end

     private

     def find_class_id
          DndClass.find_by(name: params[:dnd_class].capitalize).id
     end

     def find_level
          DndClassLevel.find_by(dnd_class_id: find_class_id, level: params[:level_id])
     end

end
