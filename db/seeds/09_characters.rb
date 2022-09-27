require './db/reference_data.rb'

puts 'flipping the table...'

CharSpell.destroy_all
CharSkill.destroy_all
Character.destroy_all
Character.reset_pk_sequence
CharSkill.reset_pk_sequence
CharSpell.reset_pk_sequence

puts 'rolling a new adventuring party...'

yeslah = Character.create(name: "Yeslah", level: 12, dnd_class_id: 2, race_id: 3, user_id: 1, Strength: rand(3..20), Dexterity: rand(3..20), Constitution: rand(3..20), Intelligence: rand(3..20), Wisdom: rand(3..20), Charisma: rand(3..20), image: "https://www.dndbeyond.com/avatars/9221/765/637202353794223452.jpeg?width=150&height=150&fit=crop&quality=95&auto=webp")
des = Character.create(name: "Desdemona", level: 18, dnd_class_id: 8, race_id: 9, user_id: 1, Strength: rand(3..20), Dexterity: rand(3..20), Constitution: rand(3..20), Intelligence: rand(3..20), Wisdom: rand(3..20), Charisma: rand(3..20), image: "https://www.dndbeyond.com/avatars/9221/765/637202353794223452.jpeg?width=150&height=150&fit=crop&quality=95&auto=webp")
bri = Character.create(name: "Brilaela", level: 8, dnd_class_id: 10, race_id: 5, user_id: 2, Strength: rand(3..20), Dexterity: rand(3..20), Constitution: rand(3..20), Intelligence: rand(3..20), Wisdom: rand(3..20), Charisma: rand(3..20), image: "https://www.dndbeyond.com/avatars/9221/765/637202353794223452.jpeg?width=150&height=150&fit=crop&quality=95&auto=webp")
amy = Character.create(name: "Amethyst", level: 6, dnd_class_id: 12, race_id: 7, user_id: 2, Strength: rand(3..20), Dexterity: rand(3..20), Constitution: rand(3..20), Intelligence: rand(3..20), Wisdom: rand(3..20), Charisma: rand(3..20), image: "https://www.dndbeyond.com/avatars/9221/765/637202353794223452.jpeg?width=150&height=150&fit=crop&quality=95&auto=webp")

Character.all.each {|character| character.calculate_hp}