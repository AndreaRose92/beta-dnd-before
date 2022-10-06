class DndClassesController < ApplicationController
  skip_before_action :authorize, only: [:index, :show]

  def index
    render json: JSON.parse(RestClient.get("#{api_url}/classes"))["results"]
  end

  def show
    dc = find_class
    if !dc
      dc = parse_class_data
      dc[:subclasses] = []
      dc[:subclasses] << parse_subclass_data
      dc[:dnd_class_levels] = parse_level_data(false, dc)
    end
    render json: dc
  end

  def create
    dc = DndClass.find_or_create_by(index: params[:dnd_class]) do |new_class|
      new_class.update(parse_class_data)
    end
    subclass = Subclass.find_or_create_by(dnd_class: dc) do |new_subclass|
      new_subclass.update(parse_subclass_data)
    end
    parse_level_data(true, dc)
    subclass_levels = JSON.parse(RestClient.get("#{api_url}/subclasses/#{subclass.index}/levels"))
    subclass_levels.each do |level|
      if level["subclass_specific"]
        specs = "#{level["subclass_specific"].keys[0]}: #{level["subclass_specific"].values[0]}"
      else
        specs = nil
      end
      SubclassLevel.find_or_create_by(dnd_class_level: DndClassLevel.find_by(dnd_class: dc, level: level["level"])) do |lvl|
        lvl.update(
            subclass: subclass,
            feature_names: stringify_fetch(level["features"]),
            subclass_specific: specs,
            index: level["index"]
        )
      end
    end
    render json: dc
  end

  private

  def find_class
    DndClass.find_by(index: params[:dnd_class])
  end

  def class_data
    JSON.parse(RestClient.get("#{api_url}/classes/#{params[:dnd_class]}"))
  end

  def subclass_data
    JSON.parse(RestClient.get("#{api_url}/subclasses/#{class_data["subclasses"][0]["index"]}"))
  end

  def level_data
    JSON.parse(RestClient.get("#{api_url}/classes/#{params[:dnd_class]}/levels"))
  end

  def saves
    class_data["saving_throws"]
  end

  def spellcasting
    class_data["spellcasting"] ? class_data["spellcasting"] : nil
  end

  def parse_class_data
    dnd_class = {
      name: class_data["name"],
      index: class_data["index"],
      hit_die: class_data["hit_die"],
      recommended_stat_one: parse_stat(saves[0]["name"]),
      recommended_stat_two: parse_stat(saves[1]["name"]),
      starting_skills: class_data["proficiency_choices"][0]["choose"],
    }
  end

  def parse_subclass_data
    subclass = {
      name: subclass_data["name"],
      flavor: subclass_data["subclass_flavor"],
      desc: subclass_data["desc"].join(" "),
      index: subclass_data["index"],
    }
  end

  def spellcasting(level)
    data = {}
    if level["spellcasting"]
      casting = level["spellcasting"]
      data = {
        cantrips_known: casting && casting["cantrips_known"] ? casting["cantrips_known"] : nil,
        spells_known: casting && casting["spells_known"] ? casting["spells_known"] : nil,
        lvl_1_spell_slots: casting && casting["spell_slots_level_1"] ? casting["spell_slots_level_1"] : nil,
        lvl_2_spell_slots: casting && casting["spell_slots_level_2"] ? casting["spell_slots_level_2"] : nil,
        lvl_3_spell_slots: casting && casting["spell_slots_level_3"] ? casting["spell_slots_level_3"] : nil,
        lvl_4_spell_slots: casting && casting["spell_slots_level_4"] ? casting["spell_slots_level_4"] : nil,
        lvl_5_spell_slots: casting && casting["spell_slots_level_5"] ? casting["spell_slots_level_5"] : nil,
        lvl_6_spell_slots: casting && casting["spell_slots_level_6"] ? casting["spell_slots_level_6"] : nil,
        lvl_7_spell_slots: casting && casting["spell_slots_level_7"] ? casting["spell_slots_level_7"] : nil,
        lvl_8_spell_slots: casting && casting["spell_slots_level_8"] ? casting["spell_slots_level_8"] : nil,
        lvl_9_spell_slots: casting && casting["spell_slots_level_9"] ? casting["spell_slots_level_9"] : nil,
      }
    else
      data = nil
    end
    data
  end

  def parse_level_data(post, dc)
    levels = []
    level_data.each do |level|
      new_level = {
        index: level["index"],
        level: level["level"],
        ability_score_bonuses: level["ability_score_bonuses"],
        prof_bonus: level["prof_bonus"],
        feature_names: stringify_fetch(level["features"]),
      }
      spellcasting(level) ? new_level.merge(spellcasting(level)) : nil
      specifics = level["class_specific"].each do |key, value|
        new_level["#{key}"] = value
      end
      post ? DndClassLevel.find_or_create_by(dnd_class: dc, level: new_level[:level]) do |lvl| lvl.update(new_level) end : nil
      levels << new_level
    end
    levels
  end
end
