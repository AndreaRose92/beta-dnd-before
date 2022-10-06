class EquipmentController < ApplicationController
  def index
    render json: JSON.parse(RestClient.get("#{api_url}/equipment_categories/weapons"))["equipment"]
  end

  def show
    item = find_item
    if !item
      item = weapon_data(false)
    end
    render json: item
  end

  def create
    item = find_item
    if !item
        item = weapon_data(true)
    end
    render json: item
  end
  
  private

  def find_item
    Equipment.find_by(index: params[:item])
  end

  def weapon_data(post)
    weapon_data = JSON.parse(RestClient.get("#{api_url}/equipment/#{params[:item]}"))
    range = weapon_data["range"] ? weapon_data["range"] : nil
    damage_dice = weapon_data["damage"] ? weapon_data["damage"]["damage_dice"] : nil
    weapon_category = weapon_data["weapon_category"] ? weapon_data["weapon_category"] : nil
    weapon_range = weapon_data["weapon_range"] ? weapon_data["weapon_range"] : nil
    normal_range = range ? range["normal"] : nil
    long_range = range ? range["long"] ? range["long"] : nil : nil
    desc = weapon_data["desc"] ? weapon_data["desc"].join(". ") : nil
    properties = weapon_data["properties"] ? stringify_fetch(weapon_data["properties"]) : nil

    new_weapon = {
      name: weapon_data["name"],
      index: weapon_data["index"],
      dSize: damage_dice ? damage_data(damage_dice)[1] : nil,
      dAmt: damage_dice ? damage_data(damage_dice)[0] : nil,
      modifier: damage_dice ? damage_data(damage_dice)[2] : nil,
      damage_type: weapon_data["damage"] ? weapon_data["damage"]["damage_type"]["name"] : nil,
      weapon_category: weapon_category,
      weapon_range: weapon_range,
      normal_range: normal_range,
      long_range: long_range,
      properties: properties,
      desc: desc,
    }
    post ? weapon = Equipment.create(new_weapon) : weapon = new_weapon
    weapon
  end
end
