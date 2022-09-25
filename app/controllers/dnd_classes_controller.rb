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

     def dnd_class_url
          DndClass.find_by(name: params[:id].capitalize).url
     end

end
