require 'json'

BardSlots = [[2,4,2,0,0,0,0,0,0,0,0],[2,5,3,0,0,0,0,0,0,0,0],[2,6,4,2,0,0,0,0,0,0,0],[3,7,4,3,0,0,0,0,0,0,0],[3,8,4,3,1,0,0,0,0,0,0],[3,9,4,3,2,0,0,0,0,0,0],[3,10,4,3,3,1,0,0,0,0,0],[3,11,4,3,3,2,0,0,0,0,0],[3,12,4,3,3,3,1,0,0,0,0],[3,14,4,3,3,3,2,0,0,0,0],[3,15,4,3,3,3,2,1,0,0,0],[3,15,4,3,3,3,2,1,0,0,0],[3,16,4,3,3,3,2,1,1,0,0],[3,18,4,3,3,3,2,1,1,0,0],[3,19,4,3,3,3,2,1,1,1,0],[3,19,4,3,3,3,2,1,1,1,0],[3,20,4,3,3,3,2,1,1,1,1],[3,22,4,3,3,3,2,1,1,1,1],[3,22,4,3,3,3,3,1,1,1,1],[3,22,4,3,3,3,3,2,1,1,1]
]

ClericSlots = [[3,0,2,0,0,0,0,0,0,0,0],[3,0,3,0,0,0,0,0,0,0,0],[3,0,4,2,0,0,0,0,0,0,0],[4,0,4,3,0,0,0,0,0,0,0],[4,0,4,3,2,0,0,0,0,0,0],[4,0,4,3,3,0,0,0,0,0,0],[4,0,4,3,3,1,0,0,0,0,0],[4,0,4,3,3,2,0,0,0,0,0],[4,0,4,3,3,3,1,0,0,0,0],[5,0,4,3,3,3,2,0,0,0,0],[5,0,4,3,3,3,2,1,0,0,0],[5,0,4,3,3,3,2,1,0,0,0],[5,0,4,3,3,3,2,1,1,0,0],[5,0,4,3,3,3,2,1,1,0,0],[5,0,4,3,3,3,2,1,1,1,0],[5,0,4,3,3,3,2,1,1,1,0],[5,0,4,3,3,3,2,1,1,1,1],[5,0,4,3,3,3,3,1,1,1,1],[5,0,4,3,3,3,3,2,1,1,1],[5,0,4,3,3,3,3,2,2,1,1]
]

DruidSlots = [[2,0,2,0,0,0,0,0,0,0,0],[2,0,3,0,0,0,0,0,0,0,0],[2,0,4,2,0,0,0,0,0,0,0],[3,0,4,3,0,0,0,0,0,0,0],[3,0,4,3,2,0,0,0,0,0,0],[3,0,4,3,3,0,0,0,0,0,0],[3,0,4,3,3,1,0,0,0,0,0],[3,0,4,3,3,2,0,0,0,0,0],[3,0,4,3,3,3,1,0,0,0,0],[4,0,4,3,3,3,2,0,0,0,0],[4,0,4,3,3,3,2,1,0,0,0],[4,0,4,3,3,3,2,1,0,0,0],[4,0,4,3,3,3,2,1,1,0,0],[4,0,4,3,3,3,2,1,1,0,0],[4,0,4,3,3,3,2,1,1,1,0],[4,0,4,3,3,3,2,1,1,1,0],[4,0,4,3,3,3,2,1,1,1,1],[4,0,4,3,3,3,3,1,1,1,1],[4,0,4,3,3,3,3,2,1,1,1],[4,0,4,3,3,3,3,2,2,1,1]
]

PaladinSlots = [[0,0,0,0,0,0,0,0,0,0,0],[0,0,2,0,0,0,0,0,0,0,0],[0,0,3,0,0,0,0,0,0,0,0],[0,0,3,0,0,0,0,0,0,0,0],[0,0,4,2,0,0,0,0,0,0,0],[0,0,4,2,0,0,0,0,0,0,0],[0,0,4,3,0,0,0,0,0,0,0],[0,0,4,3,0,0,0,0,0,0,0],[0,0,4,3,2,0,0,0,0,0,0],[0,0,4,3,2,0,0,0,0,0,0],[0,0,4,3,3,0,0,0,0,0,0],[0,0,4,3,3,0,0,0,0,0,0],[0,0,4,3,3,1,0,0,0,0,0],[0,0,4,3,3,1,0,0,0,0,0],[0,0,4,3,3,2,0,0,0,0,0],[0,0,4,3,3,2,0,0,0,0,0],[0,0,4,3,3,3,1,0,0,0,0],[0,0,4,3,3,3,1,0,0,0,0],[0,0,4,3,3,3,2,0,0,0,0],[0,0,4,3,3,3,2,0,0,0,0]
]

RangerSlots = [[0,0,0,0,0,0,0,0,0,0,0],[0,2,2,0,0,0,0,0,0,0,0],[0,3,3,0,0,0,0,0,0,0,0],[0,3,3,0,0,0,0,0,0,0,0],[0,4,4,2,0,0,0,0,0,0,0],[0,4,4,2,0,0,0,0,0,0,0],[0,5,4,3,0,0,0,0,0,0,0],[0,5,4,3,0,0,0,0,0,0,0],[0,6,4,3,2,0,0,0,0,0,0],[0,6,4,3,2,0,0,0,0,0,0],[0,7,4,3,3,0,0,0,0,0,0],[0,7,4,3,3,0,0,0,0,0,0],[0,8,4,3,3,1,0,0,0,0,0],[0,8,4,3,3,1,0,0,0,0,0],[0,9,4,3,3,2,0,0,0,0,0],[0,9,4,3,3,2,0,0,0,0,0],[0,10,4,3,3,3,1,0,0,0,0],[0,10,4,3,3,3,1,0,0,0,0],[0,11,4,3,3,3,2,0,0,0,0],[0,11,4,3,3,3,2,0,0,0,0]
]

SorcSlots = [[4,2,2,0,0,0,0,0,0,0,0],[4,3,3,0,0,0,0,0,0,0,0],[4,4,4,2,0,0,0,0,0,0,0],[5,5,4,3,0,0,0,0,0,0,0],[5,6,4,3,2,0,0,0,0,0,0],[5,7,4,3,3,0,0,0,0,0,0],[5,8,4,3,3,1,0,0,0,0,0],[5,9,4,3,3,2,0,0,0,0,0],[5,10,4,3,3,3,1,0,0,0,0],[6,11,4,3,3,3,2,0,0,0,0],[6,12,4,3,3,3,2,1,0,0,0],[6,12,4,3,3,3,2,1,1,0,0],[6,13,4,3,3,3,2,1,1,0,0],[6,13,4,3,3,3,2,1,1,0,0],[6,14,4,3,3,3,2,1,1,1,0],[6,14,4,3,3,3,2,1,1,1,0],[6,15,4,3,3,3,2,1,1,1,1],[6,15,4,3,3,3,3,1,1,1,1],[6,15,4,3,3,3,3,2,1,1,1],[6,15,4,3,3,3,3,2,2,1,1]
]

WarlockSlots = [[2,2,1,0,0,0,0,0,0,0,0],[2,3,2,0,0,0,0,0,0,0,0],[2,4,0,2,0,0,0,0,0,0,0],[3,5,0,2,0,0,0,0,0,0,0],[3,6,0,0,2,0,0,0,0,0,0],[3,7,0,0,2,0,0,0,0,0,0],[3,8,0,0,0,2,0,0,0,0,0],[3,9,0,0,0,2,0,0,0,0,0],[3,10,0,0,0,0,2,0,0,0,0],[4,10,0,0,0,0,2,0,0,0,0],[4,11,0,0,0,0,3,0,0,0,0],[4,11,0,0,0,0,3,0,0,0,0],[4,12,0,0,0,0,3,0,0,0,0],[4,12,0,0,0,0,3,0,0,0,0],[4,13,0,0,0,0,3,0,0,0,0],[4,13,0,0,0,0,3,0,0,0,0],[4,14,0,0,0,0,4,0,0,0,0],[4,14,0,0,0,0,4,0,0,0,0],[4,15,0,0,0,0,4,0,0,0,0],[4,15,0,0,0,0,4,0,0,0,0]
]

WizardSlots = [[3,0,2,0,0,0,0,0,0,0,0],[3,0,3,0,0,0,0,0,0,0,0],[3,0,4,2,0,0,0,0,0,0,0],[4,0,4,3,0,0,0,0,0,0,0],[4,0,4,3,2,0,0,0,0,0,0],[4,0,4,3,3,0,0,0,0,0,0],[4,0,4,3,3,1,0,0,0,0,0],[4,0,4,3,3,2,0,0,0,0,0],[4,0,4,3,3,3,1,0,0,0,0],[5,0,4,3,3,3,2,0,0,0,0],[5,0,4,3,3,3,2,1,0,0,0],[5,0,4,3,3,3,2,1,0,0,0],[5,0,4,3,3,3,2,1,1,0,0],[5,0,4,3,3,3,2,1,1,0,0],[5,0,4,3,3,3,2,1,1,1,0],[5,0,4,3,3,3,2,1,1,1,0],[5,0,4,3,3,3,2,1,1,1,1],[5,0,4,3,3,3,2,1,1,1,1],[5,0,4,3,3,3,3,2,1,1,1],[5,0,4,3,3,3,3,2,2,1,1]
]

puts 'seeding users...'

User.create(username: "AndreaRose", password: "420-password")
User.create(username: "Samwise", password: "420-password")

puts 'seeding classes...'

class_response = RestClient.get("http://www.dnd5eapi.co/api/classes")
dnd_classes = JSON.parse(class_response)["results"]
dnd_classes.each { |dc| DndClass.create(name: dc["name"], url: dc["url"]) }

DndClass.find_by(name: "Barbarian").update(hit_die: 12, recommended_stat_one: "Strength", recommended_stat_two: "Constitution", starting_proficiencies: 2)
DndClass.find_by(name: "Bard").update(hit_die: 8, recommended_stat_one: "Charisma", recommended_stat_two: "Dexterity", starting_proficiencies: 3)
DndClass.find_by(name: "Cleric").update(hit_die: 8, recommended_stat_one: "Wisdom", recommended_stat_two: "Strength or Constitution", starting_proficiencies: 2)
DndClass.find_by(name: "Druid").update(hit_die: 8, recommended_stat_one: "Wisdom", recommended_stat_two: "Constitution", starting_proficiencies: 2)
DndClass.find_by(name: "Fighter").update(hit_die: 10, recommended_stat_one: "Strength or Dexterity", recommended_stat_two: "Constitution", starting_proficiencies: 2)
DndClass.find_by(name: "Monk").update(hit_die: 8, recommended_stat_one: "Dexterity", recommended_stat_two: "Wisdom", starting_proficiencies: 2)
DndClass.find_by(name: "Paladin").update(hit_die: 10, recommended_stat_one: "Strength", recommended_stat_two: "Charisma", starting_proficiencies: 2)
DndClass.find_by(name: "Ranger").update(hit_die: 10, recommended_stat_one: "Dexterity", recommended_stat_two: "Wisdom", starting_proficiencies: 3)
DndClass.find_by(name: "Rogue").update(hit_die: 8, recommended_stat_one: "Dexterity", recommended_stat_two: "Intelligence or Charisma", starting_proficiencies: 4)
DndClass.find_by(name: "Sorcerer").update(hit_die: 6, recommended_stat_one: "Charisma", recommended_stat_two: "Constitution", starting_proficiencies: 2)
DndClass.find_by(name: "Warlock").update(hit_die: 8, recommended_stat_one: "Charisma", recommended_stat_two: "Constitution", starting_proficiencies: 2)
DndClass.find_by(name: "Wizard").update(hit_die: 6, recommended_stat_one: "Intelligence", recommended_stat_two: "Constitution or Dexterity", starting_proficiencies: 2)

DndClass.all.each do |dc|

    def feature_filter name, array
        bard_filters = ["Bardic Inspiration", "Song of Rest", "Spellcasting"]
        cleric_filters = ["Channel Divinity", "Destroy Undead", "Spellcasting"]
        druid_filters = ["Wild Shape", "Spellcasting"]
        fighter_filters = ["Action Surge", "Extra Attack", "Indomitable"]
        monk_filters = ["Martial Arts", "Unarmored Movement"]
        paladin_filters = ["Spellcasting"]
        ranger_filters = ["Favored Enemy", "Spellcasting", "Natural Explorer"]
        rogue_filters = ["Sneak Attack"]
        sorcerer_filters = ["Spellcasting", "Flexible Casting", "Metamagic"]
        warlock_filters = ["Eldritch Invocations", "Mystic Arcanum"]
        wizard_filters = ["Spellcasting", "Arcane Recovery"]
        case name
        when "Barbarian"
            new_array = array
        when "Bard"
            new_array = array.delete_if{ |str| bard_filters.any?{|feature| str.include?(feature)}}
        when "Cleric"
            new_array = array.delete_if{ |str| cleric_filters.any?{|feature| str.include?(feature)}}
        when "Druid"
            new_array = array.delete_if{ |str| druid_filters.any?{|feature| str.include?(feature)}}
        when "Fighter"
            new_array = array.delete_if{ |str| fighter_filters.any?{|feature| str.include?(feature)}}
        when "Monk"
            new_array = array.delete_if{ |str| monk_filters.any?{|feature| str.include?(feature)}}
        when "Paladin"
            new_array = array.delete_if{ |str| paladin_filters.any?{|feature| str.include?(feature)}}
        when "Ranger"
            new_array = array.delete_if{ |str| ranger_filters.any?{|feature| str.include?(feature)}}
        when "Rogue"
            new_array = array.delete_if{ |str| rogue_filters.any?{|feature| str.include?(feature)}}
        when "Sorcerer"
            new_array = array.delete_if{ |str| sorcerer_filters.any?{|feature| str.include?(feature)}}
        when "Warlock"
            new_array = array.delete_if{ |str| warlock_filters.any?{|feature| str.include?(feature)}}
        when "Wizard"
            new_array = array.delete_if{ |str| wizard_filters.any?{|feature| str.include?(feature)}}
        end
        new_array
    end

    puts "seeding #{dc.name} levels..."

    20.times do |c|
        response = RestClient.get("http://dnd5eapi.co/api/classes/#{dc.name.downcase}/levels/#{c+1}")
        data = JSON.parse(response)
        class_specific = data["class_specific"]
        # byebug
        new_level = DndClassLevel.create(
            level: data["level"],
            features: feature_filter(dc.name, data["features"].pluck("name")).join(", "),
            prof_bonus: data["prof_bonus"],
            ability_score_bonuses: data["ability_score_bonuses"],
            dnd_class_id: DndClass.find_by(name: "#{dc.name}").id
        )
        case dc.name
        when "Barbarian"
            new_level.update(
                rage_count: class_specific["rage_count"],
                rage_damage_bonus: class_specific["rage_damage_bonus"],
                brutal_critical_dice: class_specific["brutal_critical_dice"]
            )
        when "Bard"
            new_level.update(
                bardic_inspiration_die: class_specific["bardic_inspiration_die"],
                song_of_rest_die: class_specific["song_of_rest_die"],
                magical_secrets_max_5: class_specific["magical_secrets_max_5"],
                magical_secrets_max_7: class_specific["magical_secrets_max_7"],
                magical_secrets_max_9: class_specific["magical_secrets_max_9"],
            )
        when "Cleric"
            new_level.update(
                channel_divinity_charges: class_specific["class_divinity_charges"],
                destroy_undead_cr: class_specific["destroy_undead_cr"]
            )
        when "Druid"
            new_level.update(
                wild_shape_max_cr: class_specific["wild_shape_max_cr"],
                wild_shape_swim: class_specific["wild_shape__swim"],
                wild_shape_fly: class_specific["wild_shape_fly"]
            )
        when "Fighter"
            new_level.update(
                action_surges: class_specific["action_surges"],
                indomitable_uses: class_specific["indomitable_uses"],
                extra_attacks: class_specific["extra_attacks"]
            )
        when "Monk"
            new_level.update(
                martial_arts_dice_count: class_specific["martial_arts_dice_count"],
                martial_arts_dice_value: class_specific["martial_arts_dice_value"],
                ki_points: class_specific["ki_points"],
                unarmored_movement: class_specific["unarmored_movement"]
            )
        when "Paladin"
            new_level.update(
                aura_range: class_specific["aura_range"]
            )
        when "Ranger"
            new_level.update(
                favored_enemies: class_specific["favored_enemies"],
                favored_terrain: class_specific["favored_terrain"]
            )
        when "Rogue"
            new_level.update(
                sneak_attack_dice_count: class_specific["sneak_attack_dice_count"],
                sneak_attack_dice_value: class_specific["sneak_attack_dice_value"]
            )
        when "Sorcerer"
            new_level.update(
                sorcery_points: class_specific["sorcery_points"],
                metamagic_known: class_specific["metamagic_known"],
                create_lvl_1_slot: class_specific["create_lvl_1_slot"],
                create_lvl_2_slot: class_specific["create_lvl_2_slot"],
                create_lvl_3_slot: class_specific["create_lvl_3_slot"],
                create_lvl_4_slot: class_specific["create_lvl_4_slot"],
                create_lvl_5_slot: class_specific["create_lvl_5_slot"]
            )
        when "Warlock"
            new_level.update(
                invocations_known: class_specific["invocations_known"],
                mystic_arcanum_level_6: class_specific["mystic_arcanum_level_6"],
                mystic_arcanum_level_7: class_specific["mystic_arcanum_level_7"],
                mystic_arcanum_level_8: class_specific["mystic_arcanum_level_8"],
                mystic_arcanum_level_9: class_specific["mystic_arcanum_level_9"]
            )
        when "Wizard"
            new_level.update(
                arcane_recovery_levels: class_specific["arcane_recovery_levels"]
            )
        end
    end
end

puts 'seeding races...'

race_response = RestClient.get('http://www.dnd5eapi.co/api/races')
races = JSON.parse(race_response)["results"]
races.each { |r| 
    Race.create(name: r["name"], url: r["url"])
}

Race.all.each { |race| 
    response = RestClient.get("http://www.dnd5eapi.co#{race.url}")
    data = JSON.parse(response)
    Race.update(
        ability_score_bonuses: data["ability_bonuses"].map {|ab| "#{ab["ability_score"]["name"]} +#{ab["bonus"]}"}.join(", "),
        size: data["size"],
        languages: data["languages"].pluck("name").join(", "),
        traits: data["traits"].pluck("name").join(", "),
        speed: data["speed"]
    )
}

puts 'seeding skills...'

skills = [{name: 'Acrobatics', stat: 'Dexterity'}, {name: 'Animal Handling', stat: 'Wisdom'}, {name: 'Arcana', stat: 'Intelligence'}, {name: 'Athletics', stat: 'Strength'}, {name: 'Deception', stat: 'Charisma'}, {name: 'History', stat: 'Intelligence'}, {name: 'Insight', stat: 'Wisdom'}, {name: 'Intimidation', stat: 'Charisma'}, {name: 'Investigation', stat: 'Intelligence'}, {name: 'Medicine', stat: 'Wisdom'}, {name: 'Nature', stat: 'Intelligence'}, {name: 'Perception', stat: 'Wisdom'}, {name: 'Performance', stat: 'Charisma'}, {name: 'Persuasion', stat: 'Charisma'}, {name: 'Religion', stat: 'Intelligence'}, {name: 'Sleight of Hand', stat: 'Dexterity'}, {name: 'Stealth', stat: 'Dexterity'}, {name: 'Survival', stat: 'Wisdom'}, {name: 'Strength Save', stat: 'Strength'}, {name: 'Dexterity Save', stat: 'Dexterity'}, {name: 'Constitution Save', stat: 'Constitution'}, {name: 'Intelligence Save', stat: 'Intelligence'}, {name: 'Wisdom Save', stat: 'Wisdom'}, {name: 'Charisma Save', stat: 'Charisma'}]

skills.each {|skill| Proficiency.create(name: skill[:name], stat: skill[:stat])}

puts 'seeding class/race/skill join tables...'

class_skills = [[1,2],[1,4],[1,8],[1,11],[1,12],[1,18],[1,19],[1,21],[2,1],[2,2],[2,3],[2,4],[2,5],[2,6],[2,7],[2,8],[2,9],[2,10],[2,11],[2,12],[2,13],[2,14],[2,15],[2,16],[2,17],[2,18],[2,20],[2,24],[3,6],[3,7],[3,10],[3,14],[3,15],[3,23],[3,24],[4,3],[4,2],[4,7],[4,10],[4,11],[4,12],[4,15],[4,18],[4,22],[4,23],[5,1],[5,2],[5,4],[5,6],[5,7],[5,8],[5,9],[5,12],[5,18],[5,19],[5,21],[6,1],[6,4],[6,6],[6,7],[6,15],[6,17],[6,19],[6,20],[7,4],[7,7],[7,8],[7,10],[7,14],[7,15],[7,23],[7,24],[8,2],[8,4],[8,7],[8,9],[8,11],[8,12],[8,17],[8,18],[8,19],[8,20],[9,1],[9,4],[9,5],[9,7],[9,8],[9,9],[9,12],[9,13],[9,14],[9,16],[9,17],[9,20],[9,22],[10,3],[10,5],[10,7],[10,8],[10,14],[10,15],[10,21],[10,24],[11,3],[11,5],[11,6],[11,8],[11,9],[11,15],[11,23],[11,24],[12,3],[12,6],[12,7],[12,9],[12,10],[12,15],[12,22],[12,23]]
class_skills.each {|cs| ClassSkill.create(dnd_class_id: cs[0], proficiency_id: cs[1])}

race_skills = [[3, 12], [6, 8]]
race_skills.each {|rs| RaceSkill.create(race_id: rs[0], proficiency_id: rs[1])}

puts 'seeding characters...'

yeslah = Character.create(name: "Yeslah", level: 12, dnd_class_id: 2, race_id: 3, user_id: 1, Strength: 12, Dexterity: 12, Constitution: 12, Intelligence: 12, Wisdom: 12, Charisma: 12, hp: 45, current_hp: 100, image: "https://www.dndbeyond.com/avatars/9221/765/637202353794223452.jpeg?width=150&height=150&fit=crop&quality=95&auto=webp")
des = Character.create(name: "Desdemona", level: 18, dnd_class_id: 8, race_id: 9, user_id: 1, Strength: 15, Dexterity: 15, Constitution: 15, Intelligence: 15, Wisdom: 15, Charisma: 15, hp: 90, current_hp: 82, image: "https://www.dndbeyond.com/avatars/9221/765/637202353794223452.jpeg?width=150&height=150&fit=crop&quality=95&auto=webp")
bri = Character.create(name: "Brilaela", level: 8, dnd_class_id: 10, race_id: 5, user_id: 2, Strength: 15, Dexterity: 8, Constitution: 18, Intelligence: 6, Wisdom: 8, Charisma: 20, hp: 120, current_hp: 63, image: "https://www.dndbeyond.com/avatars/9221/765/637202353794223452.jpeg?width=150&height=150&fit=crop&quality=95&auto=webp")
amy = Character.create(name: "Amethyst", level: 6, dnd_class_id: 12, race_id: 7, user_id: 2, Strength: 8, Dexterity: 20, Constitution: 12, Intelligence: 19, Wisdom: 16, Charisma: 14, hp: 80, current_hp: 75, image: "https://www.dndbeyond.com/avatars/9221/765/637202353794223452.jpeg?width=150&height=150&fit=crop&quality=95&auto=webp")



char_skills = [[1,1],[1,5],[1,7],[1,12],[1,13],[1,16],[1,17],[1,20],[1,24],[2,4],[2,7],[2,9],[2,12],[2,16],[2,17],[2,18],[2,19],[2,20],[3,4],[3,5],[3,8],[3,12],[3,13],[3,14],[3,19],[3,21],[4,3],[4,5],[4,16],[4,17],[4,21],[4,22]]

char_skills.each { |skill|
    CharSkill.create(character_id: skill[0], proficiency_id: skill[1])
}


puts 'seeding spell table...'

BardSlots.each do |level| SpellLevel.create(dnd_class_id: 2, cantrips_known: level[0], spells_known: level[1], lvl_1: level[2], lvl_2: level[3], lvl_3: level[4], lvl_4: level[5],lvl_5: level[6],lvl_6: level[7],lvl_7: level[8],lvl_8: level[9],lvl_9: level[10]) end
ClericSlots.each do |level| SpellLevel.create(dnd_class_id: 3, cantrips_known: level[0], spells_known: level[1], lvl_1: level[2], lvl_2: level[3], lvl_3: level[4], lvl_4: level[5],lvl_5: level[6],lvl_6: level[7],lvl_7: level[8],lvl_8: level[9],lvl_9: level[10]) end
DruidSlots.each do |level| SpellLevel.create(dnd_class_id: 4, cantrips_known: level[0], spells_known: level[1], lvl_1: level[2], lvl_2: level[3], lvl_3: level[4], lvl_4: level[5],lvl_5: level[6],lvl_6: level[7],lvl_7: level[8],lvl_8: level[9],lvl_9: level[10]) end
PaladinSlots.each do |level| SpellLevel.create(dnd_class_id: 7, cantrips_known: level[0], spells_known: level[1], lvl_1: level[2], lvl_2: level[3], lvl_3: level[4], lvl_4: level[5],lvl_5: level[6],lvl_6: level[7],lvl_7: level[8],lvl_8: level[9],lvl_9: level[10]) end
RangerSlots.each do |level| SpellLevel.create(dnd_class_id: 8, cantrips_known: level[0], spells_known: level[1], lvl_1: level[2], lvl_2: level[3], lvl_3: level[4], lvl_4: level[5],lvl_5: level[6],lvl_6: level[7],lvl_7: level[8],lvl_8: level[9],lvl_9: level[10]) end
SorcSlots.each do |level| SpellLevel.create(dnd_class_id: 10, cantrips_known: level[0], spells_known: level[1], lvl_1: level[2], lvl_2: level[3], lvl_3: level[4], lvl_4: level[5],lvl_5: level[6],lvl_6: level[7],lvl_7: level[8],lvl_8: level[9],lvl_9: level[10]) end
WarlockSlots.each do |level| SpellLevel.create(dnd_class_id: 11, cantrips_known: level[0], spells_known: level[1], lvl_1: level[2], lvl_2: level[3], lvl_3: level[4], lvl_4: level[5],lvl_5: level[6],lvl_6: level[7],lvl_7: level[8],lvl_8: level[9],lvl_9: level[10]) end
WizardSlots.each do |level| SpellLevel.create(dnd_class_id: 12, cantrips_known: level[0], spells_known: level[1], lvl_1: level[2], lvl_2: level[3], lvl_3: level[4], lvl_4: level[5],lvl_5: level[6],lvl_6: level[7],lvl_7: level[8],lvl_8: level[9],lvl_9: level[10]) end

puts 'seeding spells....'

spells_response = RestClient.get("http://www.dnd5eapi.co/api/spells")
spells_list = JSON.parse(spells_response)["results"]
spells_list.each do |spell| 
    spell_response = RestClient.get("https://www.dnd5eapi.co#{spell["url"]}")
    spell = JSON.parse(spell_response)
    Spell.create(
        name: spell["name"],
        desc: spell["desc"][0],
        higher_level: spell["higher_level"],
        range: spell["range"],
        ritual: spell["ritual"],
        duration: spell["duration"],
        concentration: spell["concentration"],
        level: spell["level"]
    )
end

puts 'seeding class/spell join...'

classes_with_spells = ['bard', 'cleric', 'druid', 'paladin', 'ranger','sorcerer','warlock','wizard']

classes_with_spells.each do |c|
    response = RestClient.get("https://www.dnd5eapi.co/api/classes/#{c}/spells")
    spells = JSON.parse(response)["results"]
    spells.each do |spell|
        ClassSpell.create(dnd_class: DndClass.find_by(name: c.capitalize), spell: Spell.find_by(name: spell['name']))
    end
end

puts 'done seeding'