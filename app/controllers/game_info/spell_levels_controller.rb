class SpellLevelsController < ApplicationController
  require "./db/reference_data.rb"

  def index
    render json: class_specific
  end

  def show
    level = SpellLevel.find_by(dnd_class: find_class, dnd_class_level: find_level)
    if level
      render json: level
    else
      index = (params[:level].to_i - 1)
      data = dnd_class_variable(find_class.name, index)
      new_level = {
        dnd_class: find_class,
        cantrips_known: data[0],
        spells_known: data[1],
        lvl_1: data[2],
        lvl_2: data[3],
        lvl_3: data[4],
        lvl_4: data[5],
        lvl_5: data[6],
        lvl_6: data[7],
        lvl_7: data[8],
        lvl_8: data[9],
        lvl_9: data[10],
        dnd_class_level: find_level,
      }
      render json: new_level
    end
  end

  def create
    level = SpellLevel.find_or_create_by(dnd_class: find_class, dnd_class_level_id: params[:level]) do |level|
      index = (params[:level].to_i - 1)
      data = dnd_class_variable(find_class.name, index)
      level.dnd_class = find_class
      level.cantrips_known = data[0]
      level.spells_known = data[1]
      level.lvl_1 = data[2]
      level.lvl_2 = data[3]
      level.lvl_3 = data[4]
      level.lvl_4 = data[5]
      level.lvl_5 = data[6]
      level.lvl_6 = data[7]
      level.lvl_7 = data[8]
      level.lvl_8 = data[9]
      level.lvl_9 = data[10]
      level.dnd_class_level = find_level
    end
    render json: level
  end

  private

  def find_class
    DndClass.find_by(api_index: params[:dnd_class])
  end

  def find_level
    DndClassLevel.find_by(dnd_class: find_class, level: params[:level])
  end

  def class_specific
    SpellLevel.where(dnd_class: find_class)
  end

  def dnd_class_variable(string, number)
    case string
    when "Bard"
      dc = $bardSlots[number]
    when "Cleric"
      dc = $clericSlots[number]
    when "Druid"
      dc = $druidSlots[number]
    when "Paladin"
      dc = $paladinSlots[number]
    when "Ranger"
      dc = $rangerSlots[number]
    when "Sorcerer"
      dc = $sorcererSlots[number]
    when "Warlock"
      dc = $warlockSlots[number]
    when "Wizard"
      dc = $wizardSlots[number]
    end
    dc
  end
end
