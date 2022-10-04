puts 'defeating the hordes...'

RaceSkill.destroy_all
Subrace.destroy_all
Race.destroy_all
Race.reset_pk_sequence
Subrace.reset_pk_sequence
RaceSkill.reset_pk_sequence

puts 'rebuilding society...'

races_response = RestClient.get('http://www.dnd5eapi.co/api/races')
races_data = JSON.parse(races_response)["results"]
races_data.each { |race| 
    race_response = RestClient.get("http://www.dnd5eapi.co#{race["url"]}")
    race_data = JSON.parse(race_response)
    race = Race.create(
        name: race_data["name"],
        index: race_data["index"],
        url: race_data["url"],
        size: race_data["size"],
        speed: race_data["speed"],
        languages: race_data["languages"].pluck("name").join(", "),
        traits: race_data["traits"].pluck("name").join(", "),
        strength: 0,
        dexterity: 0,
        constitution: 0,
        intelligence: 0,
        wisdom: 0,
        charisma: 0
    )
    race_data["ability_bonuses"].each { |stat|
        case stat["ability_score"]["name"]
        when "STR"
            race.update(strength: stat["bonus"])
        when "DEX"
            race.update(dexterity: stat["bonus"])
        when "CON"
            race.update(constitution: stat["bonus"])
        when "INT"
            race.update(intelligence: stat["bonus"])
        when "WIS"
            race.update(wisdom: stat["bonus"])
        when "CHA"
            race.update(charisma: stat["bonus"])
        end
    }
}

subraces_response = RestClient.get("http://www.dnd5eapi.co/api/subraces")
subraces_data = JSON.parse(subraces_response)["results"]
subraces_data.each do |subrace|
    subrace_response = RestClient.get("http://www.dnd5eapi.co#{subrace["url"]}")
    subrace_data = JSON.parse(subrace_response)
    subrace = Subrace.create(
        name: subrace_data["name"],
        race: Race.find_by(name: subrace_data["race"]["name"]),
        index: subrace_data["index"],
        url: subrace_data["url"],
        traits: subrace_data["racial_traits"].pluck("name"),
        strength: 0,
        dexterity: 0,
        constitution: 0,
        intelligence: 0,
        wisdom: 0,
        charisma: 0

    )
    subrace_data["ability_bonuses"].each do |stat|
        case stat["ability_score"]["name"]
        when "STR"
            subrace.update(strength: stat["bonus"])
        when "DEX"
            subrace.update(dexterity: stat["bonus"])
        when "CON"
            subrace.update(constitution: stat["bonus"])
        when "INT"
            subrace.update(intelligence: stat["bonus"])
        when "WIS"
            subrace.update(wisdom: stat["bonus"])
        when "CHA"
            subrace.update(charisma: stat["bonus"])
        end
    end
end