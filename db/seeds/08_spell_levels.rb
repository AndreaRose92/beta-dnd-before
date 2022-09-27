require "./db/reference_data.rb"

puts "clearing table..."

SpellLevel.destroy_all
SpellLevel.reset_pk_sequence

puts "seeding spell table..."
$bardSlots.size.times do |c| 
    lvl = $bardSlots[c]
  splvl = SpellLevel.create(
    dnd_class_id: 2,
    cantrips_known: lvl[0],
    spells_known: lvl[1],
    lvl_1: lvl[2],
    lvl_2: lvl[3],
    lvl_3: lvl[4],
    lvl_4: lvl[5],
    lvl_5: lvl[6],
    lvl_6: lvl[7],
    lvl_7: lvl[8],
    lvl_8: lvl[9],
    lvl_9: lvl[10],
    dnd_class_level: c+1
  )
  if splvl.cantrips_known == 0
    splvl.update(cantrips_known: nil)
  end
  if splvl.spells_known == 0
    splvl.update(spells_known: nil)
  end
end
$clericSlots.size.times do |c| 
    lvl = $clericSlots[c]
    splvl = SpellLevel.create(
    dnd_class_id: 3,
    cantrips_known: lvl[0],
    spells_known: lvl[1],
    lvl_1: lvl[2],
    lvl_2: lvl[3],
    lvl_3: lvl[4],
    lvl_4: lvl[5],
    lvl_5: lvl[6],
    lvl_6: lvl[7],
    lvl_7: lvl[8],
    lvl_8: lvl[9],
    lvl_9: lvl[10],
    dnd_class_level: c+1
  )
  if splvl.cantrips_known == 0
    splvl.update(cantrips_known: nil)
  end
  if splvl.spells_known == 0
    splvl.update(spells_known: nil)
  end
end
$druidSlots.size.times do |c| 
    lvl = $druidSlots[c]
    splvl = SpellLevel.create(
    dnd_class_id: 4,
    cantrips_known: lvl[0],
    spells_known: lvl[1],
    lvl_1: lvl[2],
    lvl_2: lvl[3],
    lvl_3: lvl[4],
    lvl_4: lvl[5],
    lvl_5: lvl[6],
    lvl_6: lvl[7],
    lvl_7: lvl[8],
    lvl_8: lvl[9],
    lvl_9: lvl[10],
    dnd_class_level: c+1
  )
  if splvl.cantrips_known == 0
    splvl.update(cantrips_known: nil)
  end
  if splvl.spells_known == 0
    splvl.update(spells_known: nil)
  end
end
$paladinSlots.size.times do |c| 
    lvl = $paladinSlots[c]
    splvl = SpellLevel.create(
    dnd_class_id: 7,
    cantrips_known: lvl[0],
    spells_known: lvl[1],
    lvl_1: lvl[2],
    lvl_2: lvl[3],
    lvl_3: lvl[4],
    lvl_4: lvl[5],
    lvl_5: lvl[6],
    lvl_6: lvl[7],
    lvl_7: lvl[8],
    lvl_8: lvl[9],
    lvl_9: lvl[10],
    dnd_class_level: c+1
  )
  if splvl.cantrips_known == 0
    splvl.update(cantrips_known: nil)
  end
  if splvl.spells_known == 0
    splvl.update(spells_known: nil)
  end
end
$rangerSlots.size.times do |c| 
    lvl = $rangerSlots[c]
    splvl = SpellLevel.create(
    dnd_class_id: 8,
    cantrips_known: lvl[0],
    spells_known: lvl[1],
    lvl_1: lvl[2],
    lvl_2: lvl[3],
    lvl_3: lvl[4],
    lvl_4: lvl[5],
    lvl_5: lvl[6],
    lvl_6: lvl[7],
    lvl_7: lvl[8],
    lvl_8: lvl[9],
    lvl_9: lvl[10],
    dnd_class_level: c+1
  )
  if splvl.cantrips_known == 0
    splvl.update(cantrips_known: nil)
  end
  if splvl.spells_known == 0
    splvl.update(spells_known: nil)
  end
end
$sorcererSlots.size.times do |c| 
    lvl = $sorcererSlots[c]
    splvl = SpellLevel.create(
    dnd_class_id: 10,
    cantrips_known: lvl[0],
    spells_known: lvl[1],
    lvl_1: lvl[2],
    lvl_2: lvl[3],
    lvl_3: lvl[4],
    lvl_4: lvl[5],
    lvl_5: lvl[6],
    lvl_6: lvl[7],
    lvl_7: lvl[8],
    lvl_8: lvl[9],
    lvl_9: lvl[10],
    dnd_class_level: c+1
  )
  if splvl.cantrips_known == 0
    splvl.update(cantrips_known: nil)
  end
  if splvl.spells_known == 0
    splvl.update(spells_known: nil)
  end
end
$warlockSlots.size.times do |c| 
    lvl = $warlockSlots[c]
    splvl = SpellLevel.create(
    dnd_class_id: 11,
    cantrips_known: lvl[0],
    spells_known: lvl[1],
    lvl_1: lvl[2],
    lvl_2: lvl[3],
    lvl_3: lvl[4],
    lvl_4: lvl[5],
    lvl_5: lvl[6],
    lvl_6: lvl[7],
    lvl_7: lvl[8],
    lvl_8: lvl[9],
    lvl_9: lvl[10],
    dnd_class_level: c+1
  )
  if splvl.cantrips_known == 0
    splvl.update(cantrips_known: nil)
  end
  if splvl.spells_known == 0
    splvl.update(spells_known: nil)
  end
end
$wizardSlots.size.times do |c| 
    lvl = $wizardSlots[c]
    splvl = SpellLevel.create(
    dnd_class_id: 12,
    cantrips_known: lvl[0],
    spells_known: lvl[1],
    lvl_1: lvl[2],
    lvl_2: lvl[3],
    lvl_3: lvl[4],
    lvl_4: lvl[5],
    lvl_5: lvl[6],
    lvl_6: lvl[7],
    lvl_7: lvl[8],
    lvl_8: lvl[9],
    lvl_9: lvl[10],
    dnd_class_level: c+1
  )
  if splvl.cantrips_known == 0
    splvl.update(cantrips_known: nil)
  end
  if splvl.spells_known == 0
    splvl.update(spells_known: nil)
  end
end