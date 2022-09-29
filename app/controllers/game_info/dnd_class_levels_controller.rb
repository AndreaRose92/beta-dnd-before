class DndClassLevelsController < ApplicationController
    
     skip_before_action :authorize, only: [:index, :show]

     def index
          levels = DndClassLevel.where(dnd_class_id: find_class_id)
          if levels
               render json: levels
          else
               response = RestClient.get(api_url("/api/classes/#{params[:dnd_class]}/levels"))
               data = JSON.parse(response)
               push_data = []
               data.each do |level| push_data << {
                    level: data["level"],
                    prof_bonus: data["prof_bonus"],
                    features: data["features"].pluck("name").join(", "),
                    class_specific: data["class_specific"].map{|k,v| "#{k}: #{v}"}.join(', '),
                    ability_score_bonuses: data["ability_score_bonuses"],
                    dnd_class_id: DndClass.find_by(name: params[:dnd_class]).id
               }
               render json: push_data
          end
     end

     def show
          level = find_level
          if level
               render json: level
          else
               response = RestClient.get(api_url("/api/classes/#{params[:dnd_class]}/levels/#{params[:level_id]}"))
               data = JSON.parse(response)
               new_level = {
                    level: data["level"],
                    prof_bonus: data["prof_bonus"],
                    features: data["features"].pluck("name").join(", "),
                    class_specific: data["class_specific"].map{|k,v| "#{k}: #{v}"}.join(', '),
                    ability_score_bonuses: data["ability_score_bonuses"],
                    dnd_class_id: DndClass.find_by(name: params[:dnd_class]).id
               }
               render json: new_level
          end
     end

     def create
          level = DndClassLevel.find_or_create_by(dnd_class_id: find_class_id, level: params[:level_id]) do |level|
               response = RestClient.get(api_url("/api/classes/#{params[:dnd_class]}/levels/#{params[:level_id]}"))
               data = JSON.parse(response)
               level.api_index = data["index"]
               level.url = data["url"]
               level.level = data["level"]
               level.ability_score_bonuses = data["ability_score_bonuses"]
               level.features = data["features"].pluck("name").join(", ")
               level.class_specific = data["class_specific"].map{ |k,v| "#{k}: #{v}"}.join(', ')
               level.prof_bonus = data["prof_bonus"]
          end
          render json: level
     end

     private

     def fetch_data
          JSON.parse(RestClient.get("#{api_url}/classes/#{params[:dnd_class]}/levels/#{params[:level_id]}"))
     end

     def find_class_id
          DndClass.find_by(name: params[:dnd_class].capitalize).id
     end

     def find_level
          DndClassLevel.find_by(dnd_class_id: find_class_id, level: params[:level_id])
     end

end
