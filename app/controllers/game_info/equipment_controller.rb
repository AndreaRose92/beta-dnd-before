class EquipmentController < ApplicationController
  def index
    render json: Equipment.all
  end

  def show
    item = Equipment.find_or_create_by(name: params[:id])
    if item.api_url == null
      item_response = RestClient.get("http://www.dnd5eapi.co/api/equipment/#{params[:id]}")
      item_data = JSON.parse(item_response)
      item.update!(
        name: item["name"],
        url: item["url"],
        api_index: item["index"],
      )
      if item_data["damage"]
        item.update!(
          dSize: item_data["damage"]["damage_dice"].split("d")[1],
          dAmt: item_data["damage"]["damage_dice"].split("d")[0],
          damage_type: item_data["damage"]["damage_type"]["name"],
        )
      end
      if item_data["properties"]
        item.update!(
          weapon_category: item_data["weapon_category"],
          weapon_range: item_data["weapon_range"],
          properties: item_data["properties"].pluck("name"),
        )
      end
    end
    render json: item
  end
end
