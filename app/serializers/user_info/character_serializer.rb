class CharacterSerializer < ActiveModel::Serializer
  attributes :id, :name, :level, :hp, :current_hp, :stats, :skills, :image, :class_levels, :spellcasting_level
  belongs_to :user
  has_one :dnd_class
  has_one :race

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
