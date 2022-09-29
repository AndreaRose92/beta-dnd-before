class SpellsController < ApplicationController
  
  def index
    render json: Spell.all
  end

  def show
    spell = Spell.find_by(api_index: params[:id])
    if spell
      render json: spell
    else
      new_spell = {
        name: fetch_data["name"],
        api_index: fetch_data["index"],
        desc: fetch_data["desc"][0],
        higher_level: fetch_data["higher_level"][0],
        range: fetch_data["range"],
        ritual: fetch_data["ritual"],
        duration: fetch_data["duration"],
        concentration: fetch_data["concentration"],
        level: fetch_data["level"],
        casting_time: fetch_data["casting_time"],
        dc: fetch_data["dc"] ? fetch_data["dc"]["dc_type"]["name"] : nil,
      }
      if spell_damage["damage_type"]
        new_spell.merge(damage: {
          damage_type: fetch_data["damage"]["damage_type"]["name"]
        })
      end
      if slot_damage
        new_spell.merge(damage: {
          damage_type: fetch_data["damage"]["damage_type"]["name"],
          slot_lvl_1: slot_damage["1"] ? slot_damage["1"] : nil,
          slot_lvl_2: slot_damage["2"] ? slot_damage["2"] : nil,
          slot_lvl_3: slot_damage["3"] ? slot_damage["3"] : nil,
          slot_lvl_4: slot_damage["4"] ? slot_damage["4"] : nil,
          slot_lvl_5: slot_damage["5"] ? slot_damage["5"] : nil,
          slot_lvl_6: slot_damage["6"] ? slot_damage["6"] : nil,
          slot_lvl_7: slot_damage["7"] ? slot_damage["7"] : nil,
          slot_lvl_8: slot_damage["8"] ? slot_damage["8"] : nil,
          slot_lvl_9: slot_damage["9"] ? slot_damage["9"] : nil
        })
      elsif char_damage
        new_spell.merge(damage: {
          damage_type: spell_data["damage"]["damage_type"]["name"],
          char_lvl_1: char_damage["1"],
          char_lvl_5: char_damage["5"],
          char_lvl_11: char_damage["11"],
          char_lvl_17: char_damage["17"]
        })
      end
      render json: new_spell
    end
  end

  def create
    spell = Spell.find_or_create_by(api_index: params[:spell]) do |spell|
      spell.name = fetch_data["name"]
      spell.desc = fetch_data["name"]
      spell.higher_level = fetch_data["higher_level"][0]
      spell.range = fetch_data["range"]
      spell.ritual = fetch_data["ritual"]
      spell.duration = fetch_data["duration"]
      spell.concentration = fetch_data["concentration"]
      spell.level = fetch_data["level"]
      spell.casting_time = fetch_data["casting_time"]
      spell.dc = fetch_data["dc"] ? fetch_data["dc"]["dc_type"]["name"] : nil
    end
    fetch_data["classes"].each do |dc| ClassSpell.create!(dnd_class: DndClass.find_by(name: dc["name"]), spell: spell) end
    if slot_damage
      damage = SpellDamage.create!(
        spell: spell,
        damage_type: fetch_data["damage_type"],
        slot_lvl_1: slot_damage["1"] ? slot_damage["1"] : nil,
        slot_lvl_2: slot_damage["2"] ? slot_damage["2"] : nil,
        slot_lvl_3: slot_damage["3"] ? slot_damage["3"] : nil,
        slot_lvl_4: slot_damage["4"] ? slot_damage["4"] : nil,
        slot_lvl_5: slot_damage["5"] ? slot_damage["5"] : nil,
        slot_lvl_6: slot_damage["6"] ? slot_damage["6"] : nil,
        slot_lvl_7: slot_damage["7"] ? slot_damage["7"] : nil,
        slot_lvl_8: slot_damage["8"] ? slot_damage["8"] : nil,
        slot_lvl_9: slot_damage["9"] ? slot_damage["9"] : nil
      )
    elsif char_damage
      damage = SpellDamage.create!(
        spell: spell,
        damage_type: fetch_data["damage_type"],
        char_lvl_1: char_damage["1"],
        char_lvl_5: char_damage["5"],
        char_lvl_11: char_damage["11"],
        char_lvl_17: char_damage["17"]
      )
    end
    render json: spell
  end

  def class_specific
    render json: dnd_class_spells
  end

  def level_specific
    render json: spells_by_level
  end

  def class_level_specific
    render json: DndClass.find_by(api_index: params[:dnd_class]).spells.where(level: params[:level])
  end

  private

  def dnd_class_spells
    DndClass.find_by(api_index: params[:dnd_class]).spells
  end

  def spells_by_level
    Spell.where(level: params[:level])
  end

  def fetch_data
    response = RestClient.get("http://www.dnd5eapi.co/api/spells/#{params[:spell]}")
    data = JSON.parse(response)
    data
  end

  def spell_damage
    return fetch_data["damage"]
  end

  def slot_damage
    return spell_damage["damage_at_slot_level"]
  end
  
  def char_damage
    return spell_damage["damage_at_character_level"]
  end
end
