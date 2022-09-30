require "./db/reference_data.rb"

DndClass.destroy_all
DndClass.reset_pk_sequence

puts "finding a job..."

all_classes = JSON.parse(RestClient.get("#{$api_url}/classes"))["results"]
all_subclasses = JSON.parse(RestClient.get("#{$api_url}/subclasses"))["results"]

all_classes.each { |dc|
  class_data = JSON.parse(RestClient.get("#{$api_url}/classes/#{dc["index"]}"))
  skills = []
  class_data["proficiency_choices"][0]["from"]["options"].each do |opt|
    skills << opt["item"]["index"].delete_prefix("skill-")
  end
  saves = class_data["saving_throws"]
  spellcasting = class_data["spellcasting"] ? class_data["spellcasting"] : nil

  new_class = DndClass.create(
    name: class_data["name"],
    index: class_data["index"],
    hit_die: class_data["hit_die"],
    recommended_stat_one: parse_stat(saves[0]["name"]),
    recommended_stat_two: parse_stat(saves[1]["name"]),
    starting_skills: class_data["proficiency_choices"][0]["choose"],
  )
  skills.each do |skill|
    ClassSkill.create(dnd_class: new_class, skill: Skill.find_by(index: skill))
  end
  saves.each do |save|
    ClassSkill.create(dnd_class: new_class, skill: Skill.find_by(name: "#{parse_stat(save["name"])} save"))
  end
  if class_data["spellcasting"]
    spell_data = JSON.parse(RestClient.get("#{$api_url}/classes/#{new_class.index}/spells"))["results"]
    spell_data.each do |spell|
      ClassSpell.create!(dnd_class: new_class, spell: Spell.find_by(index: spell["index"]))
    end
  end
}

all_subclasses.each { |sdc|
  subclass_data = JSON.parse(RestClient.get("#{$api_url}/subclasses/#{sdc["index"]}"))

  subclass = Subclass.create!(
    name: subclass_data["name"],
    flavor: subclass_data["subclass_flavor"],
    desc: subclass_data["desc"][0],
    index: subclass_data["index"],
    dnd_class: DndClass.find_by(name: subclass_data["class"]["name"]),
  )
}
