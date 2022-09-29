class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def stringify_fetch array
    array.pluck("name").join(", ")
  end

  def parse_stat string
    case string
    when "STR"
      "Strength"
    when "DEX"
      "Dexterity"
    when "CON"
      "Constitution"
    when "INT"
      "Intelligence"
    when "WIS"
      "Wisdom"
    when "CHA"
      "Charisma"
    end
  end

  def find_abi array
    stat_bonuses = {
      Strengh: 0,
      Dexterity: 0,
      Constitution: 0,
      Intelligence: 0,
      Wisdom: 0,
      Charisma: 0,
    }
    array.each { |stat| 
      stat_bonuses[parse_stat(stat["ability_score"]["name"])] = stat["bonus"]
    }
    stat_bonuses
  end
end
