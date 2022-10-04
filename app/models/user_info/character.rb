class Character < ApplicationRecord
  belongs_to :dnd_class
  belongs_to :race
  belongs_to :user
  has_many :character_spells, dependent: :destroy
  has_many :character_skills, dependent: :destroy
  has_many :character_equips, dependent: :destroy
  has_many :skills, through: :character_skills
  has_many :spells, through: :character_spells
  has_many :equipment, through: :character_equips
  has_many :dnd_class_levels, through: :dnd_class

  validates :name, presence: :true
  validates :level, inclusion: (1..20)
  validates :current_hp, comparison: {less_than_or_equal_to: :max_hp}
  validates :strength, :dexterity, :constitution, :intelligence, :wisdom, :charisma, inclusion: (3..20)

  attr_accessor :hp_option, :hp_values, :skill_choices, :spell_choices, :spellcasting_modifier, :class_levels

  def class_levels
    self.dnd_class.dnd_class_levels.first(self.level)
  end
  
  def race_bonus stat_name
    self.race.subraces[0] ? self[stat_name] + self.race[stat_name] + self.race.subraces[0][stat_name] : self[stat_name] + self.race[stat_name]
  end

  def stat_modifier number
    modifier = ((number - 10)/2.floor)
  end

  def stat_data stat_name
    {
      name: stat_name.capitalize,
      base_value: self[stat_name],
      value: self.race_bonus(stat_name),
      modifier: self.stat_modifier(self.race_bonus(stat_name))
    }
  end

  def calculate_hp option='fixed', values=nil
    hit_die = self.dnd_class.hit_die
    modifier = self.stat_modifier(self.race_bonus("constitution"))
    base_hp = (hit_die + modifier)
    avg_hit_die = ((hit_die + 1)/2)
    total_hp = 0
    if option == 'fixed'
      total_hp = (avg_hit_die + modifier) * (self.level - 1)
    elsif option == 'rolled'
      total_hp = (values.sum) + (modifier * (self.level - 1))
    end
    total_hp = total_hp + base_hp
    self.update(max_hp: total_hp, current_hp: total_hp)
  end

  def spellcasting_modifier
    case self.dnd_class.name
    when "Bard"
      self.stat_modifier(race_bonus(:charisma))
    when "Cleric"
      self.stat_modifier(race_bonus(:wisdom))
    when "Druid"
      self.stat_modifier(race_bonus(:wisdom))
    when "Paladin"
      self.stat_modifier(race_bonus(:charisma))
    when "Ranger"
      self.stat_modifier(race_bonus(:wisdom))
    when "Sorcerer"
      self.stat_modifier(race_bonus(:charisma))
    when "Warlock"
      self.stat_modifier(race_bonus(:charisma))
    when "Wizard"
      self.stat_modifier(race_bonus(:intelligence))
    end
  end

  def is_proficient name
    self.skills.pluck(:name).include?(name)
  end

  def max_spell_level
    if self.class_levels.last.lvl_9_spell_slots != nil
      9
    elsif self.class_levels.last.lvl_8_spell_slots != nil
      8
    elsif self.class_levels.last.lvl_7_spell_slots != nil
      7
    elsif self.class_levels.last.lvl_6_spell_slots != nil
      6
    elsif self.class_levels.last.lvl_5_spell_slots != nil
      5
    elsif self.class_levels.last.lvl_4_spell_slots != nil
      4
    elsif self.class_levels.last.lvl_3_spell_slots != nil
      3
    elsif self.class_levels.last.lvl_2_spell_slots != nil
      2
    elsif self.class_levels.last.lvl_1_spell_slots != nil
      1
    end
  end

  def assign_cantrips
    while self.spells.where(level: 0).size < self.class_levels.last.cantrips_known - 1
      CharacterSpell.create(character: self, spell: self.dnd_class.spells.where(level: 0).sample)
    end
  end

  def assign_spells_known
    while self.spells.where('level > ?', 0).size < self.class_levels.last.spells_known - 1
      CharacterSpell.create(character: self, spell: self.dnd_class.spells.where('level <= ?', self.max_spell_level).sample)
    end
  end

  def assign_spells_by_modifier stat
    while self.spells.where('level > ?', 0).size < self.stat_modifier(self.race_bonus(stat)) + self.level - 1
      CharacterSpell.create(character: self, spell: self.dnd_class.spells.where('level <= ?', self.max_spell_level).sample)
    end
  end

  def assign_random_cantrips
    case self.dnd_class.name
    when "Bard"
      self.assign_cantrips
    when "Cleric"
      self.assign_cantrips
    when "Druid"
      self.assign_cantrips
    when "Sorcerer"
      self.assign_cantrips
    when "Warlock"
      self.assign_cantrips
    when "Wizard"
      self.assign_cantrips
    when "Barbarian"
      nil
    when "Fighter"
      nil
    when "Monk"
      nil
    when "Paladin"
      nil
    when "Ranger"
      nil
    when "Rogue"
      nil
    end
  end

  def assign_random_spells
    case self.dnd_class.name
    when "Bard"
      self.assign_spells_known
    when "Ranger"
      self.assign_spells_known
    when "Sorcer"
      self.assign_spells_known
    when "Warlock"
      self.assign_spells_known
    when "Cleric"
      self.assign_spells_by_modifier("wisdom")
    when "Druid"
      self.assign_spells_by_modifier("wisdom")
    when "Wizard"
      self.assign_spells_by_modifier("intelligence")
    when "Paladin"
      self.assign_spells_by_modifier("charisma")
    when "Barbarian"
      nil
    when "Fighter"
      nil
    when "Monk"
      nil
    when "Rogue"
      nil
    end
  end
end
