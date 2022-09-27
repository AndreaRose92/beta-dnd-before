require './db/reference_data.rb'

puts 'clearing table...'

ClassSpell.destroy_all
ClassSpell.reset_pk_sequence

puts 'seeding spell table...'
lvl = 0
$bardSlots.each do |level| SpellLevel.create(dnd_class_id: 2, dnd_class_level:lvl+1, cantrips_known: level[0], spells_known: level[1], lvl_1: level[2], lvl_2: level[3], lvl_3: level[4], lvl_4: level[5],lvl_5: level[6],lvl_6: level[7],lvl_7: level[8],lvl_8: level[9],lvl_9: level[10]) end
lvl = 0
$clericSlots.each do |level| SpellLevel.create(dnd_class_id: 3, dnd_class_level:lvl+1, cantrips_known: level[0], spells_known: level[1], lvl_1: level[2], lvl_2: level[3], lvl_3: level[4], lvl_4: level[5],lvl_5: level[6],lvl_6: level[7],lvl_7: level[8],lvl_8: level[9],lvl_9: level[10]) end
lvl = 0
$druidSlots.each do |level| SpellLevel.create(dnd_class_id: 4, dnd_class_level:lvl+1, cantrips_known: level[0], spells_known: level[1], lvl_1: level[2], lvl_2: level[3], lvl_3: level[4], lvl_4: level[5],lvl_5: level[6],lvl_6: level[7],lvl_7: level[8],lvl_8: level[9],lvl_9: level[10]) end
lvl = 0
$paladinSlots.each do |level| SpellLevel.create(dnd_class_id: 7, dnd_class_level:lvl+1, cantrips_known: level[0], spells_known: level[1], lvl_1: level[2], lvl_2: level[3], lvl_3: level[4], lvl_4: level[5],lvl_5: level[6],lvl_6: level[7],lvl_7: level[8],lvl_8: level[9],lvl_9: level[10]) end
lvl = 0
$rangerSlots.each do |level| SpellLevel.create(dnd_class_id: 8, dnd_class_level:lvl+1, cantrips_known: level[0], spells_known: level[1], lvl_1: level[2], lvl_2: level[3], lvl_3: level[4], lvl_4: level[5],lvl_5: level[6],lvl_6: level[7],lvl_7: level[8],lvl_8: level[9],lvl_9: level[10]) end
lvl = 0
$sorcererSlots.each do |level| SpellLevel.create(dnd_class_id: 10, dnd_class_level:lvl+1, cantrips_known: level[0], spells_known: level[1], lvl_1: level[2], lvl_2: level[3], lvl_3: level[4], lvl_4: level[5],lvl_5: level[6],lvl_6: level[7],lvl_7: level[8],lvl_8: level[9],lvl_9: level[10]) end
lvl = 0
$warlockSlots.each do |level| SpellLevel.create(dnd_class_id: 11, dnd_class_level:lvl+1, cantrips_known: level[0], spells_known: level[1], lvl_1: level[2], lvl_2: level[3], lvl_3: level[4], lvl_4: level[5],lvl_5: level[6],lvl_6: level[7],lvl_7: level[8],lvl_8: level[9],lvl_9: level[10]) end
lvl = 0
$wizardSlots.each do |level| SpellLevel.create(dnd_class_id: 12, dnd_class_level:lvl+1, cantrips_known: level[0], spells_known: level[1], lvl_1: level[2], lvl_2: level[3], lvl_3: level[4], lvl_4: level[5],lvl_5: level[6],lvl_6: level[7],lvl_7: level[8],lvl_8: level[9],lvl_9: level[10]) end
