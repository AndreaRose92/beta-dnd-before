require './db/reference_data.rb'

puts 'destroying old data...'

RaceSkill.destroy_all
RaceSkill.reset_pk_sequence
ClassSkill.destroy_all
ClassSkill.reset_pk_sequence
ClassSpell.destroy_all
ClassSpell.reset_pk_sequence

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
    spells.each { |spell| ClassSpell.create(dnd_class: DndClass.find_by(name: c.capitalize), spell: Spell.find_by(name: spell['name'])) }
end