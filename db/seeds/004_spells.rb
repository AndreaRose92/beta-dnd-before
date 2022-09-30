require "./db/reference_data.rb"

Spell.destroy_all
Spell.reset_pk_sequence

puts "searching the archives..."

all_spells = JSON.parse(RestClient.get("#{$api_url}/spells"))["results"]

all_spells.each do |spell|
  spell_data = JSON.parse(RestClient.get("#{$api_url}/spells/#{spell["index"]}"))

  if spell["damage"]
    damage = spell["damage"]
  end
  if damage && damage["damage_at_slot_level"]
    slot_damage = damage["damage_at_slot_level"]
  end
  if damage && damage["damage_at_character_level"]
    character_damage = damage["damage_at_character_level"]
  end

  Spell.create!(
    name: spell_data["name"],
    index: spell_data["index"],
    desc: spell_data["desc"][0],
    higher_level: spell_data["higher_level"],
    range: spell_data["range"],
    ritual: spell_data["ritual"],
    concentration: spell_data["concentration"],
    duration: spell_data["duration"],
    level: spell_data["level"],
    casting_time: spell_data["casting_time"],
    dc: spell_data["dc"] ? spell_data["dc"] : nil,
    damage_type: damage ? damage["damage_type"] : nil,
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
  )
end
