class Character < ApplicationRecord
  has_many :char_skills, dependent: :destroy
  has_many :proficiencies, through: :char_skills
  has_many :char_spells, dependent: :destroy
  has_many :spells, through: :char_spells
  belongs_to :user
  belongs_to :dnd_class
  belongs_to :race

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

  def calculate_hp option, values = nil
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

end
