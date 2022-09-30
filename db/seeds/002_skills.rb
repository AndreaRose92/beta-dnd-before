require "./db/reference_data.rb"

Skill.destroy_all
Skill.reset_pk_sequence

puts "learning a skill..."

all_skills = JSON.parse(RestClient.get("http://www.dnd5eapi.co/api/skills"))["results"]

all_skills.each do |skill|
  skill_data = JSON.parse(RestClient.get("http://dnd5eapi.co/api/skills/#{skill["index"]}"))
  Skill.create!(
    name: skill_data["name"],
    desc: skill_data["desc"][0],
    stat: parse_stat(skill_data["ability_score"]["name"]),
    index: skill_data["index"],
  )
end

Skill.create(
  name: "strength save",
  stat: "strength",
)
Skill.create(
  name: "dexterity save",
  stat: "Dexterity",
)
Skill.create(
  name: "constitution save",
  stat: "constitution",
)
Skill.create(
  name: "intelligence save",
  stat: "intelligence",
)
Skill.create(
  name: "wisdom save",
  stat: "wisdom",
)
Skill.create(
  name: "charisma save",
  stat: "charisma",
)
