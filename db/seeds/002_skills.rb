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
    is_save: false
  )
end

Skill.create(
  name: "strength save",
  stat: "strength",
  is_save: true
)
Skill.create(
  name: "dexterity save",
  stat: "dexterity",
  is_save: true
)
Skill.create(
  name: "constitution save",
  stat: "constitution",
  is_save: true
)
Skill.create(
  name: "intelligence save",
  stat: "intelligence",
  is_save: true
)
Skill.create(
  name: "wisdom save",
  stat: "wisdom",
  is_save: true
)
Skill.create(
  name: "charisma save",
  stat: "charisma",
  is_save: true
)
