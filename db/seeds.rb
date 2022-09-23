require 'json'

def url endpoint
    return "http://www.dnd5eapi.co/api/#{endpoint}"
end

puts 'seeding users...'

User.create(username: "AndreaRose", password: "420-password")
User.create(username: "Samwise", password: "420-password")

puts 'seeding classes...'

class_response = RestClient.get("http://www.dnd5eapi.co/api/classes")
dnd_classes = JSON.parse(class_response)["results"]
dnd_classes.each { |dc|
    DndClass.create(name: dc["name"], url: dc["url"])
}

puts 'seeding races...'

race_response = RestClient.get('http://www.dnd5eapi.co/api/races')
races = JSON.parse(race_response)["results"]
races.each { |r| 
    Race.create(name: r["name"], url: r["url"])
}

puts 'seeding skills...'

skills = [{name: 'Acrobatics', stat: 'Dexterity'}, {name: 'Animal Handling', stat: 'Wisdom'}, {name: 'Arcana', stat: 'Intelligence'}, {name: 'Athletics', stat: 'Strength'}, {name: 'Deception', stat: 'Charisma'}, {name: 'History', stat: 'Intelligence'}, {name: 'Insight', stat: 'Wisdom'}, {name: 'Intimidation', stat: 'Charisma'}, {name: 'Investigation', stat: 'Intelligence'}, {name: 'Medicine', stat: 'Wisdom'}, {name: 'Nature', stat: 'Intelligence'}, {name: 'Perception', stat: 'Wisdom'}, {name: 'Performance', stat: 'Charisma'}, {name: 'Persuasion', stat: 'Charisma'}, {name: 'Religion', stat: 'Intelligence'}, {name: 'Sleight of Hand', stat: 'Dexterity'}, {name: 'Stealth', stat: 'Dexterity'}, {name: 'Survival', stat: 'Wisdom'}, {name: 'Strength Save', stat: 'Strength'}, {name: 'Dexterity Save', stat: 'Dexterity'}, {name: 'Constitution Save', stat: 'Constitution'}, {name: 'Intelligence Save', stat: 'Intelligence'}, {name: 'Wisdom Save', stat: 'Wisdom'}, {name: 'Charisma Save', stat: 'Charisma'}]

skills.each {|skill| Proficiency.create(name: skill[:name], stat: skill[:stat])}

puts 'creating class/race/skill join tables...'


class_skills = [[1,2],[1,4],[1,8],[1,11],[1,12],[1,18],[1,19],[1,21],[2,1],[2,2],[2,3],[2,4],[2,5],[2,6],[2,7],[2,8],[2,9],[2,10],[2,11],[2,12],[2,13],[2,14],[2,15],[2,16],[2,17],[2,18],[2,20],[2,24],[3,6],[3,7],[3,10],[3,14],[3,15],[3,23],[3,24],[4,3],[4,2],[4,7],[4,10],[4,11],[4,12],[4,15],[4,18],[4,22],[4,23],[5,1],[5,2],[5,4],[5,6],[5,7],[5,8],[5,9],[5,12],[5,18],[5,19],[5,21],[6,1],[6,4],[6,6],[6,7],[6,15],[6,17],[6,19],[6,20],[7,4],[7,7],[7,8],[7,10],[7,14],[7,15],[7,23],[7,24],[8,2],[8,4],[8,7],[8,9],[8,11],[8,12],[8,17],[8,18],[8,19],[8,20],[9,1],[9,4],[9,5],[9,7],[9,8],[9,9],[9,12],[9,13],[9,14],[9,16],[9,17],[9,20],[9,22],[10,3],[10,5],[10,7],[10,8],[10,14],[10,15],[10,21],[10,24],[11,3],[11,5],[11,6],[11,8],[11,9],[11,15],[11,23],[11,24],[12,3],[12,6],[12,7],[12,9],[12,10],[12,15],[12,22],[12,23]]
class_skills.each {|cs| ClassSkill.create(dnd_class_id: cs[0], proficiency_id: cs[1])}


race_skills = [[3, 12], [6, 8]]
race_skills.each {|rs| RaceSkill.create(race_id: rs[0], proficiency_id: rs[1])}

puts 'seeding characters...'

yeslah = Character.create(name: "Yeslah", level: 12, dnd_class_id: 2, race_id: 3, user_id: 1, Strength: 12, Dexterity: 12, Constitution: 12, Intelligence: 12, Wisdom: 12, Charisma: 12, hp: 45, current_hp: 100, image: "https://www.dndbeyond.com/avatars/9221/765/637202353794223452.jpeg?width=150&height=150&fit=crop&quality=95&auto=webp")
des = Character.create(name: "Desdemona", level: 18, dnd_class_id: 8, race_id: 9, user_id: 1, Strength: 15, Dexterity: 15, Constitution: 15, Intelligence: 15, Wisdom: 15, Charisma: 15, hp: 90, current_hp: 82, image: "https://www.dndbeyond.com/avatars/9221/765/637202353794223452.jpeg?width=150&height=150&fit=crop&quality=95&auto=webp")
bri = Character.create(name: "Brilaela", level: 8, dnd_class_id: 10, race_id: 5, user_id: 2, Strength: 15, Dexterity: 8, Constitution: 18, Intelligence: 6, Wisdom: 8, Charisma: 20, hp: 120, current_hp: 63, image: "https://www.dndbeyond.com/avatars/9221/765/637202353794223452.jpeg?width=150&height=150&fit=crop&quality=95&auto=webp")
amy = Character.create(name: "Amethyst", level: 6, dnd_class_id: 12, race_id: 7, user_id: 2, Strength: 8, Dexterity: 20, Constitution: 12, Intelligence: 19, Wisdom: 16, Charisma: 14, hp: 80, current_hp: 75, image: "https://www.dndbeyond.com/avatars/9221/765/637202353794223452.jpeg?width=150&height=150&fit=crop&quality=95&auto=webp")


DndClass.find_by(name: "Barbarian").update(hit_die: 12, recommended_stat_one: "Strength", recommended_stat_two: "Constitution")
DndClass.find_by(name: "Bard").update(hit_die: 8, recommended_stat_one: "Charisma", recommended_stat_two: "Dexterity")
DndClass.find_by(name: "Cleric").update(hit_die: 8, recommended_stat_one: "Wisdom", recommended_stat_two: "Strength or Constitution")
DndClass.find_by(name: "Druid").update(hit_die: 8, recommended_stat_one: "Wisdom", recommended_stat_two: "Constitution")
DndClass.find_by(name: "Fighter").update(hit_die: 10, recommended_stat_one: "Strength or Dexterity", recommended_stat_two: "Constitution")
DndClass.find_by(name: "Monk").update(hit_die: 8, recommended_stat_one: "Dexterity", recommended_stat_two: "Wisdom")
DndClass.find_by(name: "Paladin").update(hit_die: 10, recommended_stat_one: "Strength", recommended_stat_two: "Charisma")
DndClass.find_by(name: "Ranger").update(hit_die: 10, recommended_stat_one: "Dexterity", recommended_stat_two: "Wisdom")
DndClass.find_by(name: "Rogue").update(hit_die: 8, recommended_stat_one: "Dexterity", recommended_stat_two: "Intelligence or Charisma")
DndClass.find_by(name: "Sorcerer").update(hit_die: 6, recommended_stat_one: "Charisma", recommended_stat_two: "Constitution")
DndClass.find_by(name: "Warlock").update(hit_die: 8, recommended_stat_one: "Charisma", recommended_stat_two: "Constitution")
DndClass.find_by(name: "Wizard").update(hit_die: 6, recommended_stat_one: "Intelligence", recommended_stat_two: "Constitution or Dexterity")

char_skills = [[1,1],[1,5],[1,7],[1,12],[1,13],[1,16],[1,17],[1,20],[1,24],[2,4],[2,7],[2,9],[2,12],[2,16],[2,17],[2,18],[2,19],[2,20],[3,4],[3,5],[3,8],[3,12],[3,13],[3,14],[3,19],[3,21],[4,3],[4,5],[4,16],[4,17],[4,21],[4,22]]

char_skills.each { |skill|
    CharSkill.create(character_id: skill[0], proficiency_id: skill[1])
}

puts 'seeding class levels...'

20.times do |c|
    response = RestClient.get("http://dnd5eapi.co/api/classes/barbarian/levels/#{c+1}")
    data = JSON.parse(response)
    new_level = BarbarianLevel.create(
        level: data["level"],
        prof_bonus: data["prof_bonus"],
        features: data["features"].pluck("name").join(", "),
        class_specific: data["class_specific"].map {
            |k,v| "#{k}: #{v}"
        }.join(', '),
        ability_score_bonuses: data["ability_score_bonuses"],
        dnd_class_id: DndClass.find_by(name: "Barbarian").id
    )
end
20.times do |c|
    response = RestClient.get("http://dnd5eapi.co/api/classes/bard/levels/#{c+1}")
    data = JSON.parse(response)
    new_level = BardLevel.create(
        level: data["level"],
        prof_bonus: data["prof_bonus"],
        features: data["features"].pluck("name").join(", "),
        class_specific: data["class_specific"].map {
            |k,v| "#{k}: #{v}"
        }.join(', '),
        ability_score_bonuses: data["ability_score_bonuses"],
        dnd_class_id: DndClass.find_by(name: "Bard").id
    )
end
20.times do |c|
    response = RestClient.get("http://dnd5eapi.co/api/classes/cleric/levels/#{c+1}")
    data = JSON.parse(response)
    new_level = ClericLevel.create(
        level: data["level"],
        prof_bonus: data["prof_bonus"],
        features: data["features"].pluck("name").join(", "),
        class_specific: data["class_specific"].map {
            |k,v| "#{k}: #{v}"
        }.join(', '),
        ability_score_bonuses: data["ability_score_bonuses"],
        dnd_class_id: DndClass.find_by(name: "Cleric").id
    )
end
20.times do |c|
    response = RestClient.get("http://dnd5eapi.co/api/classes/druid/levels/#{c+1}")
    data = JSON.parse(response)
    new_level = DruidLevel.create(
        level: data["level"],
        prof_bonus: data["prof_bonus"],
        features: data["features"].pluck("name").join(", "),
        class_specific: data["class_specific"].map {
            |k,v| "#{k}: #{v}"
        }.join(', '),
        ability_score_bonuses: data["ability_score_bonuses"],
        dnd_class_id: DndClass.find_by(name: "Druid").id
    )
end
20.times do |c|
    response = RestClient.get("http://dnd5eapi.co/api/classes/fighter/levels/#{c+1}")
    data = JSON.parse(response)
    new_level = FighterLevel.create(
        level: data["level"],
        prof_bonus: data["prof_bonus"],
        features: data["features"].pluck("name").join(", "),
        class_specific: data["class_specific"].map {
            |k,v| "#{k}: #{v}"
        }.join(', '),
        ability_score_bonuses: data["ability_score_bonuses"],
        dnd_class_id: DndClass.find_by(name: "Fighter").id
    )
end
20.times do |c|
    response = RestClient.get("http://dnd5eapi.co/api/classes/monk/levels/#{c+1}")
    data = JSON.parse(response)
    new_level = MonkLevel.create(
        level: data["level"],
        prof_bonus: data["prof_bonus"],
        features: data["features"].pluck("name").join(", "),
        class_specific: data["class_specific"].map {
            |k,v| "#{k}: #{v}"
        }.join(', '),
        ability_score_bonuses: data["ability_score_bonuses"],
        dnd_class_id: DndClass.find_by(name: "Monk").id
    )
end
20.times do |c|
    response = RestClient.get("http://dnd5eapi.co/api/classes/paladin/levels/#{c+1}")
    data = JSON.parse(response)
    new_level = PaladinLevel.create(
        level: data["level"],
        prof_bonus: data["prof_bonus"],
        features: data["features"].pluck("name").join(", "),
        class_specific: data["class_specific"].map {
            |k,v| "#{k}: #{v}"
        }.join(', '),
        ability_score_bonuses: data["ability_score_bonuses"],
        dnd_class_id: DndClass.find_by(name: "Paladin").id
    )
end
20.times do |c|
    response = RestClient.get("http://dnd5eapi.co/api/classes/ranger/levels/#{c+1}")
    data = JSON.parse(response)
    new_level = RangerLevel.create(
        level: data["level"],
        prof_bonus: data["prof_bonus"],
        features: data["features"].pluck("name").join(", "),
        class_specific: data["class_specific"].map {
            |k,v| "#{k}: #{v}"
        }.join(', '),
        ability_score_bonuses: data["ability_score_bonuses"],
        dnd_class_id: DndClass.find_by(name: "Ranger").id
    )
end
20.times do |c|
    response = RestClient.get("http://dnd5eapi.co/api/classes/rogue/levels/#{c+1}")
    data = JSON.parse(response)
    new_level = RogueLevel.create(
        level: data["level"],
        prof_bonus: data["prof_bonus"],
        features: data["features"].pluck("name").join(", "),
        class_specific: data["class_specific"].map {
            |k,v| "#{k}: #{v}"
        }.join(', '),
        ability_score_bonuses: data["ability_score_bonuses"],
        dnd_class_id: DndClass.find_by(name: "Rogue").id
    )
end
20.times do |c|
    response = RestClient.get("http://dnd5eapi.co/api/classes/sorcerer/levels/#{c+1}")
    data = JSON.parse(response)
    new_level = SorcererLevel.create(
        level: data["level"],
        prof_bonus: data["prof_bonus"],
        features: data["features"].pluck("name").join(", "),
        class_specific: data["class_specific"].map {
            |k,v| "#{k}: #{v}"
        }.join(', '),
        ability_score_bonuses: data["ability_score_bonuses"],
        dnd_class_id: DndClass.find_by(name: "Sorcerer").id
    )
end
20.times do |c|
    response = RestClient.get("http://dnd5eapi.co/api/classes/warlock/levels/#{c+1}")
    data = JSON.parse(response)
    new_level = WarlockLevel.create(
        level: data["level"],
        prof_bonus: data["prof_bonus"],
        features: data["features"].pluck("name").join(", "),
        class_specific: data["class_specific"].map {
            |k,v| "#{k}: #{v}"
        }.join(', '),
        ability_score_bonuses: data["ability_score_bonuses"],
        dnd_class_id: DndClass.find_by(name: "Warlock").id
    )
end
20.times do |c|
    response = RestClient.get("http://dnd5eapi.co/api/classes/wizard/levels/#{c+1}")
    data = JSON.parse(response)
    new_level = WizardLevel.create(
        level: data["level"],
        prof_bonus: data["prof_bonus"],
        features: data["features"].pluck("name").join(", "),
        class_specific: data["class_specific"].map {
            |k,v| "#{k}: #{v}"
        }.join(', '),
        ability_score_bonuses: data["ability_score_bonuses"],
        dnd_class_id: DndClass.find_by(name: "Wizard").id
    )
end

puts 'done seeding'