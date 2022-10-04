require "./db/reference_data.rb"

Equipment.destroy_all
Equipment.reset_pk_sequence

puts "visiting the blacksmith..."

all_weapons = JSON.parse(RestClient.get("#{$api_url}/equipment-categories/weapon"))["equipment"]

all_weapons.each do |weapon|
  weapon_data = JSON.parse(RestClient.get("http://www.dnd5eapi.co#{weapon["url"]}"))

  range = weapon_data["range"] ? weapon_data["range"] : nil
  damage_dice = weapon_data["damage"] ? weapon_data["damage"]["damage_dice"] : nil
  weapon_category = weapon_data["weapon_category"] ? weapon_data["weapon_category"] : nil
  weapon_range = weapon_data["weapon_range"] ? weapon_data["weapon_range"] : nil
  normal_range = range ? range["normal"] : nil
  long_range = range ? range["long"] ? range["long"] : nil : nil
  desc = weapon_data["desc"] ? weapon_data["desc"].join('. ') : nil
  properties = weapon_data["properties"] ? stringify_fetch(weapon_data["properties"]) : nil

  Equipment.create!(
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
  )
end
