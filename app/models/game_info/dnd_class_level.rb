class DndClassLevel < ApplicationRecord
  require "./db/reference_data.rb"
  belongs_to :dnd_class
  has_one :spell_level, dependent: :destroy

  def parse_class_specifics(data)
    case self.dnd_class.name
    when "Barbarian"
      features = {
        rage_count: data["rage_count"],
        rage_damage_bonus: data["rage_damage_bonus"],
        brutal_critical_dice: data["brutal_critical_dice"],
      }
    when "Bard"
      features = {
        bardic_inspiration_die: data["bardic_inspiration_die"],
        song_of_rest_die: data["song_of_rest_die"],
        magical_secrets_max_5: data["magical_secrets_max_5"],
        magical_secrets_max_7: data["magical_secrets_max_7"],
        magical_secrets_max_9: data["magical_secrets_max_9"],
      }
    when "Cleric"
      features = {
        channel_divinity_charges: data["channel_divinity_charges"],
        destroy_undead_cr: data["destroy_undead_cr"]
      }
    when "Druid"
      features = {
        wild_shape_max_cr: data["wild_shape_max_cr"],
        wild_shape_swim: data["wild_shape_swim"],
        wild_shape_fly: data["wild_shape_fly"],
      }
    when "Fighter"
      features = {
        action_surges: data["action_surges"],
        indomitable_uses: data["indomitable_uses"],
        extra_attacks: data["extra_attacks"],
      }
    when "Monk"
      features = {
        martial_arts_dice_count: data["martial_arts_dice_count"],
        martial_arts_dice_value: data["martial_arts_dice_value"],
        ki_points: data["ki_points"],
        unarmored_movement: data["unarmored_movement"],
      }
    when "Paladin"
      features = {
        aura_range: data["aura_range"],
      }
    when "Ranger"
      features = {
        favored_enemies: data["favored_enemies"],
        favored_terrain: data["favored_terrain"],
      }
    when "Rogue"
      features = {
        sneak_attack_dice_count: data["sneak_attack_dice_count"],
        sneak_attack_dice_value: data["sneak_attack_dice_value"],
      }
    when "Sorcerer"
      features = {
        sorcery_points: data["sorcery_points"],
        metamagic_known: data["metamagic_known"],
        create_lvl_1_slot: data["create_lvl_1_slot"],
        create_lvl_2_slot: data["create_lvl_2_slot"],
        create_lvl_3_slot: data["create_lvl_3_slot"],
        create_lvl_4_slot: data["create_lvl_4_slot"],
        create_lvl_5_slot: data["create_lvl_5_slot"],
      }
    when "Warlock"
      features = {
        invocations_known: data["invocations_known"],
        mystic_arcanum_level_6: data["mystic_arcanum_level_6"],
        mystic_arcanum_level_7: data["mystic_arcanum_level_7"],
        mystic_arcanum_level_9: data["mystic_arcanum_level_9"],
        mystic_arcanum_level_8: data["mystic_arcanum_level_8"],
      }
    when "Wizard"
      features = {
        arcane_recovery_levels: data["arcane_recovery_levels"],
      }
    end
    self.update(features)
  end

  def feature_filter array
    case self.dnd_class.name
    when "Barbarian"
      new_array = array
    when "Bard"
      new_array = array.delete_if { |str| $bard_filters.any? { |feature| str.include?(feature) } }
    when "Cleric"
      new_array = array.delete_if { |str| $cleric_filters.any? { |feature| str.include?(feature) } }
    when "Druid"
      new_array = array.delete_if { |str| $druid_filters.any? { |feature| str.include?(feature) } }
    when "Fighter"
      new_array = array.delete_if { |str| $fighter_filters.any? { |feature| str.include?(feature) } }
    when "Monk"
      new_array = array.delete_if { |str| $monk_filters.any? { |feature| str.include?(feature) } }
    when "Paladin"
      new_array = array.delete_if { |str| $paladin_filters.any? { |feature| str.include?(feature) } }
    when "Ranger"
      new_array = array.delete_if { |str| $ranger_filters.any? { |feature| str.include?(feature) } }
    when "Rogue"
      new_array = array.delete_if { |str| $rogue_filters.any? { |feature| str.include?(feature) } }
    when "Sorcerer"
      new_array = array.delete_if { |str| $sorcerer_filters.any? { |feature| str.include?(feature) } }
    when "Warlock"
      new_array = array.delete_if { |str| $warlock_filters.any? { |feature| str.include?(feature) } }
    when "Wizard"
      new_array = array.delete_if { |str| $wizard_filters.any? { |feature| str.include?(feature) } }
    end
    new_array.size > 0 ? self.update(features: stringify_fetch(new_array)) : nil
  end
end
