class NewCharacterSerializer < ActiveModel::Serializer
  attributes :id, :name, :level, :skill_amount, :skill_options, :spell_options, :max_spell_level, :spellcasting_level
  has_many :class_levels, serializer: DndClassLevelSerializer
  has_one :dnd_class
  has_one :race

  def attributes(*args)
    hash = super
    hash.each { |k, v|
      if v.nil?
        hash.delete(k)
      end
    }
    hash
  end

  def skill_amount
    self.object.dnd_class.starting_skills
  end

  def skill_options
    self.object.dnd_class.skills.where(is_save: false).pluck(:name)
  end

  def spellcasting_level
    self.object.class_levels.last
  end

  def max_spell_level
    if spellcasting_level.lvl_9_spell_slots && spellcasting_level.lvl_9_spell_slots > 0
      9
    elsif spellcasting_level.lvl_8_spell_slots && spellcasting_level.lvl_8_spell_slots > 0
      8
    elsif spellcasting_level.lvl_7_spell_slots && spellcasting_level.lvl_7_spell_slots > 0
      7
    elsif spellcasting_level.lvl_6_spell_slots && spellcasting_level.lvl_6_spell_slots > 0
      6
    elsif spellcasting_level.lvl_5_spell_slots && spellcasting_level.lvl_5_spell_slots > 0
      5
    elsif spellcasting_level.lvl_4_spell_slots && spellcasting_level.lvl_4_spell_slots > 0
      4
    elsif spellcasting_level.lvl_3_spell_slots && spellcasting_level.lvl_3_spell_slots > 0
      3
    elsif spellcasting_level.lvl_2_spell_slots && spellcasting_level.lvl_2_spell_slots > 0
      2
    elsif spellcasting_level.lvl_1_spell_slots && spellcasting_level.lvl_1_spell_slots > 0
      1
    else
      nil
    end
  end

  def spell_options
    self.object.dnd_class.spells.where('level <= ?', max_spell_level).pluck(:name, :level)
  end

end
