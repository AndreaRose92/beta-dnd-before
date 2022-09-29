require './db/reference_data.rb'

class Character < ApplicationRecord
  has_many :char_skills, dependent: :destroy
  has_many :char_spells, dependent: :destroy
  has_many :spell_levels, through: :dnd_class
  has_many :proficiencies, through: :char_skills
  has_many :spells, through: :char_spells
  belongs_to :user
  belongs_to :dnd_class
  belongs_to :race

  validates :name, :level, presence: true
  # validates :dnd_class_id, inclusion: (1..12)
  # validates :race_id, inclusion: (1..9)
  validates :Strength, :Dexterity, :Constitution, :Intelligence, :Wisdom, :Charisma, inclusion: (3..20)

  attr_accessor :hp_option, :hp_values, :proficiency_choices, :starting_spells

  def class_level
    self.dnd_class.dnd_class_levels.find_by(level: self.level)
  end

  def str_bonus
    self.Strength + self.race.Strength
  end

  def dex_bonus
    self.Dexterity + self.race.Dexterity
  end

  def con_bonus
    self.Constitution + self.race.Constitution
  end

  def int_bonus
    self.Intelligence + self.race.Intelligence
  end

  def wis_bonus
    self.Wisdom + self.race.Wisdom
  end

  def cha_bonus
    self.Charisma + self.race.Charisma
  end

  def stat_modifier(number)
    modifier = ((number - 10) / 2).floor
    if modifier > 0
      "+#{modifier}"
    elsif modifier < 0
      "#{modifier}"
    else
      0
    end
  end

  def calculate_hp(option = "fixed", values = nil)
    hit_die = self.dnd_class.hit_die
    modifier = self.stat_modifier(self.Constitution).to_i
    base_hp = (hit_die + modifier)
    avg_hit_die = ((hit_die + 1) / 2)
    if option == "fixed"
      total_hp = (avg_hit_die + modifier) * (self.level - 1) + base_hp
    elsif option == "rolled"
      total_hp = values.sum + (modifier * (self.level - 1)) + base_hp
    else 
      total_hp = base_hp 
    end
    self.update(hp: total_hp, current_hp: total_hp)
  end

  def spells_by_class_and_level(number)
    self.dnd_class.spells.where(level: number)
  end

  def spells_by_level(number)
    self.spells.where(level: number)
  end

  def spellcasting_level
    self.class_level.spell_level
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

  def cantrips
    self.spells.where(level: 0)
  end

  def possible_cantrips
    self.dnd_class.spells.where(level: 0)
  end

  def known_spells
    self.spells.where("level < ?", self.max_spell_level).filter { |spell| spell.level != 0 }
  end

  def possible_spells
    self.dnd_class.spells.where("level < ?", self.max_spell_level).filter { |spell| spell.level != 0 }
  end

  def assign_random_spells
    if self.possible_cantrips.size > 0
      while self.cantrips.size < self.spellcasting_level.cantrips_known
        new_cantrip = CharSpell.create(character: self, spell: self.possible_cantrips.sample)
      end
    end
    if self.dnd_class == $wizard
      while self.known_spells.size < (self.stat_modifier(self.int_bonus).to_i + self.level )
        new_spell = CharSpell.create(character: self, spell: self.possible_spells.sample)
      end
    elsif self.dnd_class == $cleric || self.dnd_class == $druid
      while self.known_spells.size < (self.stat_modifier(self.wis_bonus).to_i + self.level )
        new_spell = CharSpell.create(character: self, spell: self.possible_spells.sample)
      end
    elsif self.dnd_class == $paladin
      while self.known_spells.size < (self.stat_modifier(self.cha_bonus).to_i +  (self.level/2).floor)
        new_spell = CharSpell.create(character: self, spell: self.possible_spells.sample)
      end
    elsif self.possible_spells.size > 0
      while self.known_spells.size < self.spellcasting_level.spells_known
        new_spell = CharSpell.create(character: self, spell: self.possible_spells.sample)
      end
    end
  end
end
