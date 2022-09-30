require './db/reference_data.rb'

puts 'busting labor unions...'

Character.destroy_all
SpellLevel.destroy_all
DndClassLevel.destroy_all
ClassSpell.destroy_all
ClassSkill.destroy_all
DndClass.destroy_all
DndClass.reset_pk_sequence
ClassSkill.reset_pk_sequence
ClassSpell.reset_pk_sequence
DndClassLevel.reset_pk_sequence
SpellLevel.reset_pk_sequence
Character.reset_pk_sequence

puts 'gaining class consciousness...'

class_response = RestClient.get("http://www.dnd5eapi.co/api/classes")
dnd_classes = JSON.parse(class_response)["results"]
dnd_classes.each { |dc| DndClass.create(name: dc["name"], url: dc["url"], index: dc["index"],) }

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
        case name
        when "Barbarian"
            new_array = array
        when "Bard"
            new_array = array.delete_if{ |str| $bard_filters.any?{|feature| str.include?(feature)}}
        when "Cleric"
            new_array = array.delete_if{ |str| $cleric_filters.any?{|feature| str.include?(feature)}}
        when "Druid"
            new_array = array.delete_if{ |str| $druid_filters.any?{|feature| str.include?(feature)}}
        when "Fighter"
            new_array = array.delete_if{ |str| $fighter_filters.any?{|feature| str.include?(feature)}}
        when "Monk"
            new_array = array.delete_if{ |str| $monk_filters.any?{|feature| str.include?(feature)}}
        when "Paladin"
            new_array = array.delete_if{ |str| $paladin_filters.any?{|feature| str.include?(feature)}}
        when "Ranger"
            new_array = array.delete_if{ |str| $ranger_filters.any?{|feature| str.include?(feature)}}
        when "Rogue"
            new_array = array.delete_if{ |str| $rogue_filters.any?{|feature| str.include?(feature)}}
        when "Sorcerer"
            new_array = array.delete_if{ |str| $sorcerer_filters.any?{|feature| str.include?(feature)}}
        when "Warlock"
            new_array = array.delete_if{ |str| $warlock_filters.any?{|feature| str.include?(feature)}}
        when "Wizard"
            new_array = array.delete_if{ |str| $wizard_filters.any?{|feature| str.include?(feature)}}
        end
        new_array
    end

    puts "seeding #{dc.name} levels..."

    20.times do |c|
        response = RestClient.get("http://dnd5eapi.co/api/classes/#{dc.name.downcase}/levels/#{c+1}")
        data = JSON.parse(response)
        class_specific = data["class_specific"]
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
                martial_arts_dice_count: class_specific["martial_arts"]["dice_count"],
                martial_arts_dice_value: class_specific["martial_arts"]["dice_value"],
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
                sneak_attack_dice_count: class_specific["sneak_attack"]["dice_count"],
                sneak_attack_dice_value: class_specific["sneak_attack"]["dice_value"]
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