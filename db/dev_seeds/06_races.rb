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
        api_index: race_data["index"],
        url: race_data["url"],
        size: race_data["size"],
        speed: race_data["speed"],
        languages: race_data["languages"].pluck("name").join(", "),
        traits: race_data["traits"].pluck("name").join(", "),
        Strength: 0,
        Dexterity: 0,
        Constitution: 0,
        Intelligence: 0,
        Wisdom: 0,
        Charisma: 0
    )
    race_data["ability_bonuses"].each { |stat|
        case stat["ability_score"]["name"]
        when "STR"
            race.update(Strength: stat["bonus"])
        when "DEX"
            race.update(Dexterity: stat["bonus"])
        when "CON"
            race.update(Constitution: stat["bonus"])
        when "INT"
            race.update(Intelligence: stat["bonus"])
        when "WIS"
            race.update(Wisdom: stat["bonus"])
        when "CHA"
            race.update(Charisma: stat["bonus"])
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
        api_index: subrace_data["index"],
        url: subrace_data["url"],
        traits: subrace_data["racial_traits"].pluck("name"),
        Strength: 0,
        Dexterity: 0,
        Constitution: 0,
        Intelligence: 0,
        Wisdom: 0,
        Charisma: 0

    )
    subrace_data["ability_bonuses"].each do |stat|
        case stat["ability_score"]["name"]
        when "STR"
            subrace.update(Strength: stat["bonus"])
        when "DEX"
            subrace.update(Dexterity: stat["bonus"])
        when "CON"
            subrace.update(Constitution: stat["bonus"])
        when "INT"
            subrace.update(Intelligence: stat["bonus"])
        when "WIS"
            subrace.update(Wisdom: stat["bonus"])
        when "CHA"
            subrace.update(Charisma: stat["bonus"])
        end
    end
end