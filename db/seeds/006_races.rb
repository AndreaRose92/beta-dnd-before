require "./db/reference_data.rb"

Race.destroy_all
Race.reset_pk_sequence
Subrace.reset_pk_sequence
RaceSkill.reset_pk_sequence

puts "doing some cultural outreach..."

all_races = JSON.parse(RestClient.get("#{$api_url}/races"))["results"]

all_subraces = JSON.parse(RestClient.get("#{$api_url}/subraces"))["results"]

all_races.each do |race|
  race_data = JSON.parse(RestClient.get("#{$api_url}/races/#{race["index"]}"))

  new_race = Race.create!(
    name: race_data["name"],
    index: race_data["index"],
    size: race_data["size"],
    languages: stringify_fetch(race_data["languages"]),
    speed: race_data["speed"],
  )

  stats = find_abi(race_data["ability_bonuses"])
  new_race.update(stats)
end

all_subraces.each do |subrace|
  subrace_data = JSON.parse(RestClient.get("#{$api_url}/subraces/#{subrace["index"]}"))

  new_subrace = Subrace.create!(
    name: subrace_data["name"],
    race: Race.find_by(name: subrace_data["race"]["name"]),
    index: subrace_data["index"],
    languages: subrace_data["languages"] ? stringify_fetch(subrace_data["languages"]) : nil,
  )
  stats = find_abi(subrace_data["ability_bonuses"])
  new_subrace.update(stats)
end

RaceSkill.create(race: $elf, skill: Skill.find_by(name: "Perception"))
RaceSkill.create(race: $half_orc, skill: Skill.find_by(name: "Intimidation"))
