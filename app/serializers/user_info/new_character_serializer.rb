class NewCharacterSerializer < ActiveModel::Serializer
  attributes :id, :name, :level, :skill_amount, :skill_options, :spell_options, :max_spell_level
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
    self.object.dnd_class.skills.pluck(:name)
  end

  def max_spell_level
    if self.object.class_levels.last.lvl_9_spell_slots > 0
      9
    elsif self.object.class_levels.last.lvl_8_spell_slots > 0
      8
    elsif self.object.class_levels.last.lvl_7_spell_slots > 0
      7
    elsif self.object.class_levels.last.lvl_6_spell_slots > 0
      6
    elsif self.object.class_levels.last.lvl_5_spell_slots > 0
      5
    elsif self.object.class_levels.last.lvl_4_spell_slots > 0
      4
    elsif self.object.class_levels.last.lvl_3_spell_slots > 0
      3
    elsif self.object.class_levels.last.lvl_2_spell_slots > 0
      2
    elsif self.object.class_levels.last.lvl_1_spell_slots > 0
      1
    end
  end

  def spell_options
    {
      cantrips: self.object.dnd_class.spells.where(level: 0).pluck("name"),
      lvl_1: self.object.dnd_class.spells.where(level: 1).pluck("name"),
      lvl_2: self.object.dnd_class.spells.where(level: 2).pluck("name"),
      lvl_3: self.object.dnd_class.spells.where(level: 3).pluck("name"),
      lvl_4: self.object.dnd_class.spells.where(level: 4).pluck("name"),
      lvl_5: self.object.dnd_class.spells.where(level: 5).pluck("name"),
      lvl_6: self.object.dnd_class.spells.where(level: 6).pluck("name"),
      lvl_7: self.object.dnd_class.spells.where(level: 7).pluck("name"),
      lvl_8: self.object.dnd_class.spells.where(level: 8).pluck("name"),
      lvl_9: self.object.dnd_class.spells.where(level: 9).pluck("name")
    }
  end

end
