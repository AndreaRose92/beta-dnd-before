puts 'clearing out the armory...'

Equipment.destroy_all
Equipment.reset_pk_sequence

puts "visiting the blacksmith..."

def api_url(endpoint)
  return "http://www.dnd5eapi.co/api/equipment-categories/#{endpoint}"
end

def nested_url(endpoint)
  return "http://www.dnd5eapi.co#{endpoint}"
end

equipment_response = RestClient.get(api_url("weapon"))
all_weapons = JSON.parse(equipment_response)["equipment"]

all_weapons.each { |weapon|
  weapon_response = RestClient.get(nested_url(weapon["url"]))
  weapon_data = JSON.parse(weapon_response)

    item = Equipment.create(
        name: weapon_data["name"],
        url: weapon_data["url"],
        api_index: weapon_data["index"]
    )

    if weapon_data["damage"]
        item.update(
            dSize: weapon_data["damage"]["damage_dice"].split("d")[1],
            dAmt: weapon_data["damage"]["damage_dice"].split("d")[0],
            damage_type: weapon_data["damage"]["damage_type"]["name"]
        )
    end

    if weapon_data["properties"]
        item.update(
            weapon_category: weapon_data["weapon_category"],
            weapon_range: weapon_data["weapon_range"],
            properties: weapon_data["properties"].pluck("name")
        )
    end
}
