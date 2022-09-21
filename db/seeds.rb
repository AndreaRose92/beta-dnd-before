require 'json'

def url endpoint
    return "http://www.dnd5eapi.co/api/#{endpoint}"
end

puts 'seeding users...'

User.create(username: "AndreaRose", password: "420-password")

puts 'seeding classes...'

class_response = RestClient.get("http://www.dnd5eapi.co/api/classes")
dnd_classes = JSON.parse(class_response)["results"]
dnd_classes.each { |dc|
    DndClass.create(name: dc["name"], url: dc["url"])
}

puts 'seeding races...'

race_response = RestClient.get(url("races"))
races = JSON.parse(race_response)["results"]
races.each { |r| 
    resp = RestClient.get(url("races/#{r["index"]}"))
    race = JSON.parse(resp)
    Race.create(
        name: race["name"],
        url: race["url"],
        ability_score_bonuses: race["ability_bonuses"].map {|ab| "#{ab["ability_score"]["name"]} +#{ab["bonus"]}"}.join(", "),
        size: race["size"],
        languages: race["languages"].pluck("name").join(", "),
        traits: race["traits"].pluck("name").join(", "),
        speed: race["speed"]
        )}

puts 'seeding skills...'

skills = [{name: 'Acrobatics', stat: 'dexterity'}, {name: 'Animal Handling', stat: 'wisdom'}, {name: 'Arcana', stat: 'intelligence'}, {name: 'Athletics', stat: 'strength'}, {name: 'Deception', stat: 'charisma'}, {name: 'History', stat: 'intelligence'}, {name: 'Insight', stat: 'wisdom'}, {name: 'Intimidation', stat: 'charisma'}, {name: 'Investigation', stat: 'intelligence'}, {name: 'Medicine', stat: 'wisdom'}, {name: 'Nature', stat: 'intelligence'}, {name: 'Perception', stat: 'wisdom'}, {name: 'Performance', stat: 'charisma'}, {name: 'Persuasion', stat: 'charisma'}, {name: 'Religion', stat: 'intelligence'}, {name: 'Sleight of Hand', stat: 'dexterity'}, {name: 'Stealth', stat: 'dexterity'}, {name: 'Survival', stat: 'wisdom'}, {name: 'Strength Save', stat: 'strength'}, {name: 'Dexterity Save', stat: 'dexterity'}, {name: 'Constitution Save', stat: 'constitution'}, {name: 'Intelligence Save', stat: 'intelligence'}, {name: 'Wisdom Save', stat: 'wisdom'}, {name: 'Charisma Save', stat: 'charisma'}]

skills.each {|skill| Proficiency.create(name: skill[:name], stat: skill[:stat])}

puts 'creating class/race/skill join tables...'


class_skills = [[1,2],[1,4],[1,8],[1,11],[1,12],[1,18],[1,19],[1,21],[2,1],[2,2],[2,3],[2,4],[2,5],[2,6],[2,7],[2,8],[2,9],[2,10],[2,11],[2,12],[2,13],[2,14],[2,15],[2,16],[2,17],[2,18],[2,20],[2,24],[3,6],[3,7],[3,10],[3,14],[3,15],[3,23],[3,24],[4,3],[4,2],[4,7],[4,10],[4,11],[4,12],[4,15],[4,18],[4,22],[4,23],[5,1],[5,2],[5,4],[5,6],[5,7],[5,8],[5,9],[5,12],[5,18],[5,19],[5,21],[6,1],[6,4],[6,6],[6,7],[6,15],[6,17],[6,19],[6,20],[7,4],[7,7],[7,8],[7,10],[7,14],[7,15],[7,23],[7,24],[8,2],[8,4],[8,7],[8,9],[8,11],[8,12],[8,17],[8,18],[8,19],[8,20],[9,1],[9,4],[9,5],[9,7],[9,8],[9,9],[9,12],[9,13],[9,14],[9,16],[9,17],[9,20],[9,22],[10,3],[10,5],[10,7],[10,8],[10,14],[10,15],[10,21],[10,24],[11,3],[11,5],[11,6],[11,8],[11,9],[11,15],[11,23],[11,24],[12,3],[12,6],[12,7],[12,9],[12,10],[12,15],[12,22],[12,23]]
class_skills.each {|cs| ClassSkill.create(dnd_class_id: cs[0], proficiency_id: cs[1])}


race_skills = [[3, 12], [6, 8]]
race_skills.each {|rs| RaceSkill.create(race_id: rs[0], proficiency_id: rs[1])}

puts 'seeding characters...'

yeslah = Character.create(name: "Yeslah", level: 12, dnd_class_id: 2, race_id: 3, user_id: 1, strength: 12, dexterity: 12, constitution: 12, intelligence: 12, wisdom: 12, charisma: 12, hp: 100, current_hp: 100)


puts 'done seeding'