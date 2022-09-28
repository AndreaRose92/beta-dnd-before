require './db/reference_data.rb'

puts 'character proficiencies'

CharSkill.destroy_all
CharSkill.reset_pk_sequence
CharSpell.destroy_all
CharSpell.reset_pk_sequence

char_skills = [[1,1],[1,5],[1,7],[1,12],[1,13],[1,16],[1,17],[1,20],[1,24],[2,4],[2,7],[2,9],[2,12],[2,16],[2,17],[2,18],[2,19],[2,20],[3,4],[3,5],[3,8],[3,12],[3,13],[3,14],[3,19],[3,21],[4,3],[4,5],[4,16],[4,17],[4,21],[4,22]]

char_skills.each { |skill| CharSkill.create(character_id: skill[0], proficiency_id: skill[1]) }

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
        puts "#{character.name} is a #{character.dnd_class.name}!"
    when $cleric
        character.assign_random_spells
        puts "#{character.name} is a #{character.dnd_class.name}!"
    when $druid
        character.assign_random_spells
        puts "#{character.name} is a #{character.dnd_class.name}!"
    when $paladin
        character.assign_random_spells
        puts "#{character.name} is a #{character.dnd_class.name}!"
    when $ranger
        character.assign_random_spells
        puts "#{character.name} is a #{character.dnd_class.name}!"
    when $sorcerer
        character.assign_random_spells
        puts "#{character.name} is a #{character.dnd_class.name}!"
    when $warlock
        character.assign_random_spells
        puts "#{character.name} is a #{character.dnd_class.name}!"
    when $wizard
        character.assign_random_spells
        puts "#{character.name} is a #{character.dnd_class.name}!"
    end
}