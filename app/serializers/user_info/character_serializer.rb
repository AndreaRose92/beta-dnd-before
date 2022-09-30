class CharacterSerializer < ActiveModel::Serializer
  attributes :id, :name, :image, :level, :stats, :max_hp, :current_hp, :cantrips, :lvl_1_spells, :lvl_2_spells, :lvl_3_spells, :lvl_4_spells, :lvl_5_spells, :lvl_6_spells, :lvl_7_spells, :lvl_8_spells, :lvl_9_spells, :spellcasting_modifier
  # has_many :equipment
  # has_many :feats
  has_many :class_levels, serializer: DndClassLevelSerializer
  has_many :skills
  has_one :dnd_class
  has_one :race

  
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
    spells = self.object.spells.where(level: 0)
    spells.empty? ? spells = nil : spells = spells
  end
  
  def lvl_1_spells
    spells = self.object.spells.where(level: 1)
    spells.empty? ? spells = nil : spells = spells
  end
  
  def lvl_2_spells
    spells = self.object.spells.where(level: 2)
    spells.empty? ? spells = nil : spells = spells
  end
  
  def lvl_3_spells
    spells = self.object.spells.where(level: 3)
    spells.empty? ? spells = nil : spells = spells
  end
  
  def lvl_4_spells
    spells = self.object.spells.where(level: 4)
    spells.empty? ? spells = nil : spells = spells
  end
  
  def lvl_5_spells
    spells = self.object.spells.where(level: 5)
    spells.empty? ? spells = nil : spells = spells
  end
  
  def lvl_6_spells
    spells = self.object.spells.where(level: 6)
    spells.empty? ? spells = nil : spells = spells
  end
  
  def lvl_7_spells
    spells = self.object.spells.where(level: 7)
    spells.empty? ? spells = nil : spells = spells
  end
  
  def lvl_8_spells
    spells = self.object.spells.where(level: 8)
    spells.empty? ? spells = nil : spells = spells
  end
  
  def lvl_9_spells
    spells = self.object.spells.where(level: 9)
    spells.empty? ? spells = nil : spells = spells
  end
  
  def attributes(*args)
    hash = super
    hash.each { |k, v|
      if v.nil?
        hash.delete(k)
      end
    }
    hash
  end
end
