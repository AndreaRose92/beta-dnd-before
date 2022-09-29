class EquipmentController < ApplicationController

  skip_before_action :authorize

  def index
    response = RestClient.get("http://www.dnd5eapi.co/api/equipment-categories/weapon")
    data = JSON.parse(response)["equipment"]
    render json: data
  end

  def show
    item = Equipment.find_by(name: params[:id]) 
    if item != nil
      render json: item
    else
      item_response = RestClient.get("http://www.dnd5eapi.co/api/equipment/#{params[:id]}")
      item_data = JSON.parse(item_response)
      push_data = {
        name: item_data["name"],
        url: item_data["url"],
        api_index: item_data["index"]
      }
      if item_data["damage"]
        push_data = push_data.merge(
          dSize: item_data["damage"]["damage_dice"].split("d")[1],
          dAmt: item_data["damage"]["damage_dice"].split("d")[0],
          damage_type: item_data["damage"]["damage_type"]["name"]
        )

      end
      if item_data["properties"]
        push_data = push_data.merge(
          weapon_category: item_data["weapon_category"],
          weapon_range: item_data["weapon_range"],
          properties: item_data["properties"].pluck("name").join(', '),
        )
      end
    end
    render json: push_data
  end

  def create
    item = Equipment.find_or_create_by(name: params[:id]) do |item|
      item_response = RestClient.get("http://www.dnd5eapi.co/api/equipment/#{params[:id]}")
      item_data = JSON.parse(item_response)
        item.name = item_data["name"]
        item.url = item_data["url"]
        item.api_index = item_data["index"]
      if item_data["damage"]
          item.dSize = item_data["damage"]["damage_dice"].split("d")[1]
          item.dAmt = item_data["damage"]["damage_dice"].split("d")[0]
          item.damage_type = item_data["damage"]["damage_type"]["name"]
      end
      if item_data["properties"]
          item.weapon_category = item_data["weapon_category"]
          item.weapon_range = item_data["weapon_range"]
          item.properties = item_data["properties"].pluck("name").join(', ')
      end
    end
    render json: item
  end
end
