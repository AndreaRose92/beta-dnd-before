require "./db/reference_data.rb"

Spell.destroy_all
Spell.reset_pk_sequence

puts "searching the archives..."

all_spells = JSON.parse(RestClient.get("#{$api_url}/spells"))["results"]

all_spells.each do |spell|
  spell_data = JSON.parse(RestClient.get("#{$api_url}/spells/#{spell["index"]}"))

  if spell_data["damage"]
    damage = spell_data["damage"]
  end
  if damage && damage["damage_at_slot_level"]
    slot_damage = damage["damage_at_slot_level"]
  end
  if damage && damage["damage_at_character_level"]
    character_damage = damage["damage_at_character_level"]
  end
  if damage && damage["damage_type"]
    damage_type = damage["damage_type"]["name"]
  end
  if spell_data["higher_level"][0]
    higher_level = spell_data["higher_level"].join(' ')
  end
  if spell_data["dc"]
    dc_type = parse_stat(spell_data["dc"]["dc_type"]["name"])
    dc_success = spell_data["dc"]["dc_success"]
    dc_desc = spell_data["dc"]["desc"] ? spell_data["dc"]["desc"] : nil
  end
  if spell_data["heal_at_slot_level"]
    healing = spell_data["heal_at_slot_level"]
    damage_type = "Healing"
  end

  Spell.create!(
    name: spell_data["name"],
    index: spell_data["index"],
    desc: spell_data["desc"][0],
    higher_level: higher_level,
    range: spell_data["range"],
    ritual: spell_data["ritual"],
    concentration: spell_data["concentration"],
    duration: spell_data["duration"],
    level: spell_data["level"],
    casting_time: spell_data["casting_time"],
    dc_type: dc_type ? dc_type : nil,
    dc_success: dc_success ? dc_success : nil,
    dc_desc: dc_desc ? dc_desc : nil,
    damage_type: damage_type ? damage_type : nil,
    slot_lvl_1_damage: slot_damage ? slot_damage["1"] : nil,
    slot_lvl_2_damage: slot_damage ? slot_damage["2"] : nil,
    slot_lvl_3_damage: slot_damage ? slot_damage["3"] : nil,
    slot_lvl_4_damage: slot_damage ? slot_damage["4"] : nil,
    slot_lvl_5_damage: slot_damage ? slot_damage["5"] : nil,
    slot_lvl_6_damage: slot_damage ? slot_damage["6"] : nil,
    slot_lvl_7_damage: slot_damage ? slot_damage["7"] : nil,
    slot_lvl_8_damage: slot_damage ? slot_damage["8"] : nil,
    slot_lvl_9_damage: slot_damage ? slot_damage["9"] : nil,
    char_lvl_1_damage: character_damage ? character_damage["1"] : nil,
    char_lvl_5_damage: character_damage ? character_damage["5"] : nil,
    char_lvl_11_damage: character_damage ? character_damage["11"] : nil,
    char_lvl_17_damage: character_damage ? character_damage["17"] : nil,
    slot_lvl_1_heal: healing && healing["1"] ? healing["1"] : nil,
    slot_lvl_2_heal: healing && healing["2"] ? healing["2"] : nil,
    slot_lvl_3_heal: healing && healing["3"] ? healing["3"] : nil,
    slot_lvl_4_heal: healing && healing["4"] ? healing["4"] : nil,
    slot_lvl_5_heal: healing && healing["5"] ? healing["5"] : nil,
    slot_lvl_6_heal: healing && healing["6"] ? healing["6"] : nil,
    slot_lvl_7_heal: healing && healing["7"] ? healing["7"] : nil,
    slot_lvl_8_heal: healing && healing["8"] ? healing["8"] : nil,
    slot_lvl_9_heal: healing && healing["9"] ? healing["9"] : nil
  )
end
