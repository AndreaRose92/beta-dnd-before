require "./db/reference_data.rb"

Character.destroy_all
Character.reset_pk_sequence
CharacterEquip.reset_pk_sequence
CharacterSpell.reset_pk_sequence
CharacterSkill.reset_pk_sequence
CharacterFeat.reset_pk_sequence

User.all.each do |user|
  5.times do
    char = Character.create(
      name: Faker::Name.first_name,
      image: "https://www.dndbeyond.com/avatars/9221/765/637202353794223452.jpeg?width=150&height=150&fit=crop&quality=95&auto=webp",
      level: rand(1..20),
      dnd_class: DndClass.all.sample,
      race: Race.all.sample,
      user: user,
      strength: rand(3..20),
      dexterity: rand(3..20),
      constitution: rand(3..20),
      intelligence: rand(3..20),
      wisdom: rand(3..20),
      charisma: rand(3..20),
    )
    hp_rolls = []
    (char.level - 1).times do
      hp_rolls << rand(1..char.dnd_class.hit_die)
    end
    char.calculate_hp("rolled", hp_rolls)
    char.dnd_class.skills.last(2).each do |save|
      CharacterSkill.create(character: char, skill: save)
    end
    while char.skills.size < char.dnd_class.starting_skills + 2
      CharacterSkill.create(character: char, skill: char.dnd_class.skills.sample)
    end
    char.assign_random_cantrips
    char.assign_random_spells
    3.times do
      CharacterEquip.create(character: char, equipment: char.dnd_class.equipment.sample)
    end
    puts char.name
  end
end
