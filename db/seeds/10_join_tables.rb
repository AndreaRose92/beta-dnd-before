require './db/reference_data.rb'

puts 'destroying old data...'

RaceSkill.destroy_all
RaceSkill.reset_pk_sequence
ClassSkill.destroy_all
ClassSkill.reset_pk_sequence
ClassSpell.destroy_all
ClassSpell.reset_pk_sequence
CharSkill.destroy_all
CharSkill.reset_pk_sequence
CharSpell.destroy_all
CharSpell.reset_pk_sequence


puts 'generating join tables...'

puts 'race skills'

race_skills = [[3, 12], [6, 8]]
race_skills.each {|rs| RaceSkill.create(race_id: rs[0], proficiency_id: rs[1])}

puts 'class skills'

$class_skills.each {|cs| ClassSkill.create(dnd_class_id: cs[0], proficiency_id: cs[1])}

$classes_with_spells.each do |c|
    puts "#{c.capitalize} spells"
    response = RestClient.get("https://www.dnd5eapi.co/api/classes/#{c}/spells")
    spells = JSON.parse(response)["results"]
    spells.each do |spell|
        ClassSpell.create(dnd_class: DndClass.find_by(name: c.capitalize), spell: Spell.find_by(name: spell['name']))
    end
end

puts 'character proficiencies'

char_skills = [[1,1],[1,5],[1,7],[1,12],[1,13],[1,16],[1,17],[1,20],[1,24],[2,4],[2,7],[2,9],[2,12],[2,16],[2,17],[2,18],[2,19],[2,20],[3,4],[3,5],[3,8],[3,12],[3,13],[3,14],[3,19],[3,21],[4,3],[4,5],[4,16],[4,17],[4,21],[4,22]]

char_skills.each { |skill|
    CharSkill.create(character_id: skill[0], proficiency_id: skill[1])
}

puts 'default character spell lists'

Character.all.each { |character|
    case character.dnd_class
    when $barbarian
        puts "No Spells for #{character.name}"
    when $fighter
        puts "No Spells for #{character.name}"
    when $monk
        puts "No Spells for #{character.name}"
    when $rogue
        puts "No Spells for #{character.name}"
    when $bard
        character.assign_random_spells
        puts "#{character.name} is a Wizard! Maybe."
    when $cleric
        character.assign_random_spells
        puts "#{character.name} is a Wizard! Maybe."
    when $druid
        character.assign_random_spells
        puts "#{character.name} is a Wizard! Maybe."
    when $paladin
        character.assign_random_spells
        puts "#{character.name} is a Wizard! Maybe."
    when $ranger
        character.assign_random_spells
        puts "#{character.name} is a Wizard! Maybe."
    when $sorcerer
        character.assign_random_spells
        puts "#{character.name} is a Wizard! Maybe."
    when $warlock
        character.assign_random_spells
        puts "#{character.name} is a Wizard! Maybe."
    when $wizard
        character.assign_random_spells
        puts "#{character.name} is a Wizard! Maybe."
    end
}