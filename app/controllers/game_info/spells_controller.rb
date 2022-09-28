class SpellsController < ApplicationController
  def index
    render json: Spell.all
  end

  def show
    spell = Spell.find_or_create_by(name: params[:id])
    if spell.api_index == nil
      spell_response = RestClient.get("http://www.dnd5eapi.co/api/spells/#{params[:id]}")
      spell_data = JSON.parse(spell_response)
      new_spell = Spell.create(
        name: spell_data["name"],
        api_index: spell_data["index"],
        desc: spell_data["desc"][0],
        higher_level: spell_data["higher_level"][0],
        range: spell_data["range"],
        ritual: spell_data["ritual"],
        duration: spell_data["duration"],
        concentration: spell_data["concentration"],
        level: spell_data["level"],
        casting_time: spell_data["casting_time"],
        dc: spell_data["dc"] ? spell_data["dc"]["dc_type"]["name"] : nil,
      )
      if spell_data["damage"]
        damage = SpellDamage.create(
          spell: new_spell,
        )
        if spell_data["damage"]["damage_type"]
          damage.update(damage_type: spell_data["damage"]["damage_type"]["name"])
        end
        if spell_data["damage"]["damage_at_slot_level"]
          damage.update(
            slot_lvl_1: spell_data["damage"]["damage_at_slot_level"]["1"] ? spell_data["damage"]["damage_at_slot_level"]["1"] : nil,
            slot_lvl_2: spell_data["damage"]["damage_at_slot_level"]["2"] ? spell_data["damage"]["damage_at_slot_level"]["2"] : nil,
            slot_lvl_3: spell_data["damage"]["damage_at_slot_level"]["3"] ? spell_data["damage"]["damage_at_slot_level"]["3"] : nil,
            slot_lvl_4: spell_data["damage"]["damage_at_slot_level"]["4"] ? spell_data["damage"]["damage_at_slot_level"]["4"] : nil,
            slot_lvl_5: spell_data["damage"]["damage_at_slot_level"]["5"] ? spell_data["damage"]["damage_at_slot_level"]["5"] : nil,
            slot_lvl_6: spell_data["damage"]["damage_at_slot_level"]["6"] ? spell_data["damage"]["damage_at_slot_level"]["6"] : nil,
            slot_lvl_7: spell_data["damage"]["damage_at_slot_level"]["7"] ? spell_data["damage"]["damage_at_slot_level"]["7"] : nil,
            slot_lvl_8: spell_data["damage"]["damage_at_slot_level"]["8"] ? spell_data["damage"]["damage_at_slot_level"]["8"] : nil,
            slot_lvl_9: spell_data["damage"]["damage_at_slot_level"]["9"] ? spell_data["damage"]["damage_at_slot_level"]["9"] : nil,
          )
        elsif spell_data["damage"]["damage_at_character_level"]
          damage.update(
            char_lvl_1: spell_data["damage"]["damage_at_character_level"]["1"],
            char_lvl_5: spell_data["damage"]["damage_at_character_level"]["5"],
            char_lvl_11: spell_data["damage"]["damage_at_character_level"]["11"],
            char_lvl_17: spell_data["damage"]["damage_at_character_level"]["17"],
          )
        end
      end
    end
  end

  def class_specific
    render json: dnd_class_spells
  end

  def level_specific
    render json: spells_by_level
  end

  def class_level_specific
    render json: DndClass.find_by(name: params[:dnd_class]).spells.where(level: params[:level])
  end

  private

  def dnd_class_spells
    DndClass.find_by(name: params[:dnd_class]).spells
  end

  def spells_by_level
    Spell.where(level: params[:level])
  end
end
