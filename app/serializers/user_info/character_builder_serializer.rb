class CharacterBuilderSerializer < ActiveModel::Serializer
  attributes :id, :spellcasting_level, :available_spells, :max_spell_level
  has_one :dnd_class
  has_one :race

  def spellcasting_level
    self.object.dnd_class.dnd_class_levels.find_by(level: self.object.level).spell_level
  end

  def available_spells
    {
      cantrips: self.object.dnd_class.spells.where(level: 0).pluck(:name),
      lvl_1: self.object.dnd_class.spells.where(level: 1).pluck(:name),
      lvl_2: self.object.dnd_class.spells.where(level: 2).pluck(:name),
      lvl_3: self.object.dnd_class.spells.where(level: 3).pluck(:name),
      lvl_4: self.object.dnd_class.spells.where(level: 4).pluck(:name),
      lvl_5: self.object.dnd_class.spells.where(level: 5).pluck(:name),
      lvl_6: self.object.dnd_class.spells.where(level: 6).pluck(:name),
      lvl_7: self.object.dnd_class.spells.where(level: 7).pluck(:name),
      lvl_8: self.object.dnd_class.spells.where(level: 8).pluck(:name),
      lvl_9: self.object.dnd_class.spells.where(level: 9).pluck(:name)
    }
  end

  def max_spell_level
    if self.spellcasting_level.lvl_9 > 0
      9
    elsif self.spellcasting_level.lvl_8 > 0
      8
    elsif self.spellcasting_level.lvl_7 > 0
      7
    elsif self.spellcasting_level.lvl_6 > 0
      6
    elsif self.spellcasting_level.lvl_5 > 0
      5
    elsif self.spellcasting_level.lvl_4 > 0
      4
    elsif self.spellcasting_level.lvl_3 > 0
      3
    elsif self.spellcasting_level.lvl_2 > 0
      2
    elsif self.spellcasting_level.lvl_1 > 0
      1
    end
  end

end
