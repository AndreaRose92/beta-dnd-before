class Character < ApplicationRecord
  belongs_to :user
  belongs_to :dnd_class
  belongs_to :race
  has_many :spell_levels, through: :dnd_class
  has_many :char_skills, dependent: :destroy
  has_many :proficiencies, through: :char_skills
  has_many :char_spells, dependent: :destroy
  has_many :spells, through: :char_spells

  validates :name, :level, presence: true
  validates :dnd_class_id, inclusion: (1..12)
  validates :race_id, inclusion: (1..9)
  validates :Strength, :Dexterity, :Constitution, :Intelligence, :Wisdom, :Charisma, inclusion: (3..20)

  attr_accessor :hp_option, :hp_values, :proficiency_choices

  def str_bonus
    if self.race.Strength then self.Strength + self.race.Strength else self.Strength end
  end
  def dex_bonus
    if self.race.Dexterity then self.Dexterity + self.race.Dexterity else self.Dexterity end
  end
  def con_bonus
    if self.race.Constitution then self.Constitution + self.race.Constitution else self.Constitution end
  end
  def int_bonus
    if self.race.Intelligence then self.Intelligence + self.race.Intelligence else self.Intelligence end
  end
  def wis_bonus
    if self.race.Wisdom then self.Wisdom + self.race.Wisdom else self.Wisdom end
  end
  def cha_bonus
    if self.race.Charisma then self.Charisma + self.race.Charisma else self.Charisma end
  end

  def stat_modifier number
    modifier = ((number-10)/2).floor
    if modifier > 0
      "+#{modifier}"
    elsif modifier < 0
      "#{modifier}"
    else
      0
    end
  end

  def calculate_hp option = 'fixed', values = nil
     hit_die = self.dnd_class.hit_die
     modifier = self.stat_modifier(self.Constitution).to_i

     base_hp = (hit_die + modifier)
     avg_hit_die = ((hit_die + 1)/2)

     if option == 'fixed'
          total_hp = (avg_hit_die + modifier) * (self.level - 1) + base_hp
     elsif option == 'rolled'
          total_hp = values.sum + (modifier * (self.level - 1)) + base_hp
     elsif
          total_hp = base_hp
     end

     self.update(hp: total_hp, current_hp: total_hp)
  end

  def spells_by_class_and_level number
    self.dnd_class.spells.where(level: number)
  end

  def spells_by_level number
    self.spells.where(level: number)
  end

  def spellcasting_level
    self.dnd_class.spell_levels.first(self.level).last
  end

  def assign_random_spells
    cantrips = self.spells_by_class_and_level 0
    available_spells = []
    available_spells << self.spells_by_class_and_level 1
    available_spells << self.spells_by_class_and_level 2
    available_spells << self.spells_by_class_and_level 3
    available_spells << self.spells_by_class_and_level 4
    available_spells << self.spells_by_class_and_level 5
    available_spells << self.spells_by_class_and_level 6
    available_spells << self.spells_by_class_and_level 7
    available_spells << self.spells_by_class_and_level 8
    available_spells << self.spells_by_class_and_level 9

    while self.spells_by_class_and_level(0).length < self.spellcasting_level.cantrips_known
      CharSpell.create(character: self, spell: cantrips.sample)
    end

    while self.spells_by_class_and_level(!0) < self.spellcasting_level.spells_known
      CharSpell.create(character: self, spell: available_spells.sample)
    end

  end

end
