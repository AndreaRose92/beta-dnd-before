class Character < ApplicationRecord
  belongs_to :dnd_class
  belongs_to :race
  belongs_to :user
  has_many :character_spells, dependent: :destroy
  has_many :character_skills, dependent: :destroy
  has_many :skills, through: :character_skills
  has_many :spells, through: :character_spells

  validates :name, presence: :true
  validates :level, inclusion: (1..20)
  validates :strength, :dexterity, :constitution, :intelligence, :wisdom, :charisma, inclusion: (3..20)

  attr_accessor :hp_option, :hp_values, :skill_choices, :starting_spells, :spellcasting_modifier
  def race_bonus stat_name
    self[stat_name] + self.race[stat_name]
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

end
