class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def stringify_fetch array
    array.pluck("name").join(", ")
  end

  def parse_stat string
    case string
    when "STR"
      "strength"
    when "DEX"
      "dexterity"
    when "CON"
      "constitution"
    when "INT"
      "intelligence"
    when "WIS"
      "wisdom"
    when "CHA"
      "charisma"
    end
  end

  def find_abi array
    stat_bonuses = {
      Strengh: 0,
      dexterity: 0,
      constitution: 0,
      intelligence: 0,
      wisdom: 0,
      charisma: 0,
    }
    array.each { |stat| 
      stat_bonuses[parse_stat(stat["ability_score"]["name"])] = stat["bonus"]
    }
    stat_bonuses
  end
end
