class CharacterSerializer < ActiveModel::Serializer
  attributes :id, :name, :level, :hp, :current_hp, :stats, :skills, :image, :class_levels, :spellcasting_level, :cantrips, :lvl_1_spells, :lvl_2_spells, :lvl_3_spells,  :lvl_4_spells,  :lvl_5_spells,  :lvl_6_spells,  :lvl_7_spells,  :lvl_8_spells,  :lvl_9_spells
  belongs_to :user
  has_one :dnd_class
  has_one :race

  def cantrips
    self.object.spells.where(level: 0)
  end

  def lvl_1_spells
    self.object.spells.where(level: 1)
  end
  def lvl_2_spells
    self.object.spells.where(level: 2)
  end
  def lvl_3_spells
    self.object.spells.where(level: 3)
  end
  def lvl_4_spells
    self.object.spells.where(level: 4)
  end
  def lvl_5_spells
    self.object.spells.where(level: 5)
  end
  def lvl_6_spells
    self.object.spells.where(level: 6)
  end
  def lvl_7_spells
    self.object.spells.where(level: 7)
  end
  def lvl_8_spells
    self.object.spells.where(level: 8)
  end
  def lvl_9_spells
    self.object.spells.where(level: 9)
  end

  def skills
    self.object.proficiencies.pluck(:name)
  end

  def class_levels
    self.object.dnd_class.dnd_class_levels.limit(self.object.level)
  end

  def spellcasting_level
    self.object.spellcasting_level
  end


  def stats
    [
      {name: "Strength", base_value: self.object.Strength, value: self.object.str_bonus, modifier: self.object.stat_modifier(self.object.str_bonus)},
      {name: "Dexterity", base_value: self.object.Dexterity, value: self.object.dex_bonus, modifier: self.object.stat_modifier(self.object.dex_bonus)},
      {name: "Constitution", base_value: self.object.Constitution, value: self.object.con_bonus, modifier: self.object.stat_modifier(self.object.con_bonus)},
      {name: "Intelligence", base_value: self.object.Intelligence, value: self.object.int_bonus, modifier: self.object.stat_modifier(self.object.int_bonus)},
      {name: "Wisdom", base_value: self.object.Wisdom, value: self.object.wis_bonus, modifier: self.object.stat_modifier(self.object.wis_bonus)},
      {name: "Charisma", base_value: self.object.Charisma, value: self.object.cha_bonus, modifier: self.object.stat_modifier(self.object.cha_bonus)}
    ]
  end

end
