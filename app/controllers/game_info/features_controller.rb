class FeaturesController < ApplicationController

    skip_before_action :authorize

    def index
        render json: Feature.where(dnd_class: find_class)
    end

    def show
        feature = Feature.find_or_create_by(name: params[:name]) do |feature|
            feature_response = RestClient.get("http://www.dnd5eapi.co/api/features/#{params[:name]}")
            feature_data = JSON.parse(feature_response)
            feature.api_index = feature_data["index"]
            feature.url = feature_data["url"]
            feature.desc = feature_data["desc"][0]
            feature.level = feature_data["level"]
            feature.dnd_class_id = DndClass.find_by(name: feature_data["class"]["name"]).id
        end
        render json: feature
    end

    private

    def find_class
        DndClass.find_by(name: params[:dnd_class])
    end

end
