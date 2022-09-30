puts "burying arcane secrets..."

SpellDamage.destroy_all
SpellLevel.destroy_all
ClassSpell.destroy_all
CharSpell.destroy_all
Spell.destroy_all
Spell.reset_pk_sequence
CharSpell.reset_pk_sequence
ClassSpell.reset_pk_sequence
SpellLevel.reset_pk_sequence
SpellDamage.reset_pk_sequence

puts "discovering lost knowledge..."

spells_response = RestClient.get("http://www.dnd5eapi.co/api/spells")
spells_list = JSON.parse(spells_response)["results"]
spells_list.each do |spell|
  spell_response = RestClient.get("https://www.dnd5eapi.co#{spell["url"]}")
  spell = JSON.parse(spell_response)
  new_spell = Spell.create(
    name: spell["name"],
    index: spell["index"],
    desc: spell["desc"][0],
    higher_level: spell["higher_level"][0],
    range: spell["range"],
    ritual: spell["ritual"],
    duration: spell["duration"],
    concentration: spell["concentration"],
    level: spell["level"],
    casting_time: spell["casting_time"],
    dc: spell["dc"] ? spell["dc"]["dc_type"]["name"] : nil
  )
  if spell["damage"]
    damage = SpellDamage.create(
      spell: new_spell,
    )
    if spell["damage"]["damage_type"]
        damage.update(damage_type: spell["damage"]["damage_type"]["name"])
    end
    if spell["damage"]["damage_at_slot_level"]
      damage.update(
        slot_lvl_1: spell["damage"]["damage_at_slot_level"]["1"] ? spell["damage"]["damage_at_slot_level"]["1"] : nil,
        slot_lvl_2: spell["damage"]["damage_at_slot_level"]["2"] ? spell["damage"]["damage_at_slot_level"]["2"] : nil,
        slot_lvl_3: spell["damage"]["damage_at_slot_level"]["3"] ? spell["damage"]["damage_at_slot_level"]["3"] : nil,
        slot_lvl_4: spell["damage"]["damage_at_slot_level"]["4"] ? spell["damage"]["damage_at_slot_level"]["4"] : nil,
        slot_lvl_5: spell["damage"]["damage_at_slot_level"]["5"] ? spell["damage"]["damage_at_slot_level"]["5"] : nil,
        slot_lvl_6: spell["damage"]["damage_at_slot_level"]["6"] ? spell["damage"]["damage_at_slot_level"]["6"] : nil,
        slot_lvl_7: spell["damage"]["damage_at_slot_level"]["7"] ? spell["damage"]["damage_at_slot_level"]["7"] : nil,
        slot_lvl_8: spell["damage"]["damage_at_slot_level"]["8"] ? spell["damage"]["damage_at_slot_level"]["8"] : nil,
        slot_lvl_9: spell["damage"]["damage_at_slot_level"]["9"] ? spell["damage"]["damage_at_slot_level"]["9"] : nil,
      )
    elsif spell["damage"]["damage_at_character_level"]
      damage.update(
        char_lvl_1: spell["damage"]["damage_at_character_level"]["1"],
        char_lvl_5: spell["damage"]["damage_at_character_level"]["5"],
        char_lvl_11: spell["damage"]["damage_at_character_level"]["11"],
        char_lvl_17: spell["damage"]["damage_at_character_level"]["17"]
        )
    end
  end
end
