require './db/reference_data.rb'

ClassEquip.create(dnd_class: $barbarian, equipment: Equipment.find_by(name: "Greataxe"))
ClassEquip.create(dnd_class: $barbarian, equipment: Equipment.find_by(name: "Handaxe"))
Equipment.where(weapon_category: "Martial", weapon_range: "Melee").each do |item|
    ClassEquip.create(dnd_class: $barbarian, equipment: item)
end
Equipment.where(weapon_category: "Simple").each do |item|
    ClassEquip.create(dnd_class: $barbarian, equipment: item)
    ClassEquip.create(dnd_class: $bard, equipment: item)
    ClassEquip.create(dnd_class: $cleric, equipment: item)
    ClassEquip.create(dnd_class: $druid, equipment: item)
    ClassEquip.create(dnd_class: $monk, equipment: item)
    ClassEquip.create(dnd_class: $sorcerer, equipment: item)
    ClassEquip.create(dnd_class: $warlock, equipment: item)
end
ClassEquip.create(dnd_class: $bard, equipment: Equipment.find_by(name: "Rapier"))
ClassEquip.create(dnd_class: $bard, equipment: Equipment.find_by(name: "Longsword"))
ClassEquip.create(dnd_class: $cleric, equipment: Equipment.find_by(name: "Mace"))
ClassEquip.create(dnd_class: $cleric, equipment: Equipment.find_by(name: "Warhammer"))
ClassEquip.create(dnd_class: $cleric, equipment: Equipment.find_by(name: "Crossbow, light"))
ClassEquip.create(dnd_class: $druid, equipment: Equipment.find_by(name: "Scimitar"))
ClassEquip.create(dnd_class: $fighter, equipment: Equipment.find_by(name: "Crossbow, light"))
ClassEquip.create(dnd_class: $fighter, equipment: Equipment.find_by(name: "Handaxe"))
Equipment.where(weapon_category: "Martial").each do |item|
    ClassEquip.create(dnd_class: $fighter, equipment: item)
    ClassEquip.create(dnd_class: $paladin, equipment: item)
end
ClassEquip.create(dnd_class: $monk, equipment: Equipment.find_by(name: "Shortsword"))
Equipment.where(weapon_category: "Simple", weapon_range: "Melee").each do |item|
    ClassEquip.create(dnd_class: $paladin, equipment: item)
    ClassEquip.create(dnd_class: $ranger, equipment: item)
end
ClassEquip.create(dnd_class: $ranger, equipment: Equipment.find_by(name: "Shortsword"))
ClassEquip.create(dnd_class: $rogue, equipment: Equipment.find_by(name: "Rapier"))
ClassEquip.create(dnd_class: $rogue, equipment: Equipment.find_by(name: "Shortsword"))
ClassEquip.create(dnd_class: $rogue, equipment: Equipment.find_by(name: "Shortbow"))
ClassEquip.create(dnd_class: $sorcerer, equipment: Equipment.find_by(name: "Crossbow, light"))
ClassEquip.create(dnd_class: $warlock, equipment: Equipment.find_by(name: "Crossbow, light"))
ClassEquip.create(dnd_class: $wizard, equipment: Equipment.find_by(name: "Quarterstaff"))
ClassEquip.create(dnd_class: $wizard, equipment: Equipment.find_by(name: "Dagger"))