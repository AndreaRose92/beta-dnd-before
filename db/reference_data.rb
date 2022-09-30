$api_url = "http://www.dnd5eapi.co/api"
$barbarian = DndClass.find_by(name: "Barbarian")
$bard = DndClass.find_by(name: "Bard")
$cleric = DndClass.find_by(name: "Cleric")
$druid = DndClass.find_by(name: "Druid")
$fighter = DndClass.find_by(name: "Fighter")
$monk = DndClass.find_by(name: "Monk")
$paladin = DndClass.find_by(name: "Paladin")
$ranger = DndClass.find_by(name: "Ranger")
$rogue = DndClass.find_by(name: "Rogue")
$sorcerer = DndClass.find_by(name: "Sorcerer")
$warlock = DndClass.find_by(name: "Warlock")
$wizard = DndClass.find_by(name: "Wizard")
$dragonborn = Race.find_by(name: "Dragonborn")
$dwarf = Race.find_by(name: "Dwarf")
$elf = Race.find_by(name: "Elf")
$gnome = Race.find_by(name: "Gnome")
$half_elf = Race.find_by(name: "Half-Elf")
$half_orc = Race.find_by(name: "Half-Orc")
$halfling = Race.find_by(name: "Halfling")
$human = Race.find_by(name: "Human")
$tiefling = Race.find_by(name: "Tiefling")
$barbarian_filters = ["Brutal"]
$bard_filters = ["Bard", "Song"]
$cleric_filters = ["Channel", "Undead", "Cleric"]
$druid_filters = ["Wild", "Druid"]
$fighter_filters = ["Action", "Extra", "Indomitable"]
$monk_filters = ["Martial", "Unarmored"]
$paladin_filters = ["Paladin"]
$ranger_filters = ["Favored", "Ranger", "Natural"]
$rogue_filters = ["Sneak"]
$sorcerer_filters = ["Sorcerer", "Casting", "Metamagic"]
$warlock_filters = ["Eldritch", "Mystic"]
$wizard_filters = ["Wizard", "Arcane"]

def feature_filter name, string
  features = string.split(',').split(' ')
  case name
  when "Barbarian"
    features
  when "Bard"
    features = features.filter{ |elem| $bard_filters.each {|v| elem.include?(v) } }
  when "Cleric"
    features = features.filter{ |elem| $cleric_filters.each {|v| elem.include?(v) } }
  when "Druid"
    features = features.filter{ |elem| $druid_filters.each {|v| elem.include?(v) } }
  when "Fighter"
    features = features.filter{ |elem| $fighter_filters.each {|v| elem.include?(v) } }
  when "Monk"
    features = features.filter{ |elem| $monk_filters.each {|v| elem.include?(v) } }
  when "Paladin"
    features = features.filter{ |elem| $paladin_filters.each {|v| elem.include?(v) } }
  when "Ranger"
    features = features.filter{ |elem| $ranger_filters.each {|v| elem.include?(v) } }
  when "Rogue"
    features = features.filter{ |elem| $rogue_filters.each {|v| elem.include?(v) } }
  when "Sorcerer"
    features = features.filter{ |elem| $sorcerer_filters.each {|v| elem.include?(v) } }
  when "Warlock"
    features = features.filter{ |elem| $warlock_filters.each {|v| elem.include?(v) } }
  when "Wizard"
    features = features.filter{ |elem| $wizard_filters.each {|v| elem.include?(v) } }
  end
  if features.size > 1
    features = features.join(", ")
  elsif features.size == 1
    features = features[0]
  else
    features = nil
  end
  features
end

def parse_stat(stat)
  case stat
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

def stringify_fetch(array)
  array.pluck("name").join(", ")
end

def find_abi(array)
  stat_bonuses = {
    strength: 0,
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

def stringify_fetch(array)
  array.pluck("name").join(", ")
end

def damage_data(string)
  if string.include?("+")
    dice = string.split("+")[0]
    modifier = string.split("+")[1]
  else
    modifier = 0
    dice = string
  end

  dSize = dice.split("d")[1]
  dAmt = dice.split("d")[0]

  return [dAmt, dSize, modifier]
end
