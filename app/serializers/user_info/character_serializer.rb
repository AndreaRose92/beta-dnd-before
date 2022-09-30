class CharacterSerializer < ActiveModel::Serializer
  attributes :id, :name, :image, :level, :stats, :max_hp, :current_hp, :class_levels, :cantrips, :lvl_1_spells, :lvl_2_spells, :lvl_3_spells, :lvl_4_spells, :lvl_5_spells, :lvl_6_spells, :lvl_7_spells, :lvl_8_spells, :lvl_9_spells, :spellcasting_modifier
  has_many :equipment
  has_many :feats
  has_many :skills
  has_one :dnd_class
  has_one :race
  has_one :user

  def stats
    [
      self.object.stat_data(:strength),
      self.object.stat_data(:dexterity),
      self.object.stat_data(:constitution),
      self.object.stat_data(:intelligence),
      self.object.stat_data(:wisdom),
      self.object.stat_data(:charisma)
    ]
  end

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

end
