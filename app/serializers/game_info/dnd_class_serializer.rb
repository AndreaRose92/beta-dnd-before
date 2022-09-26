class DndClassSerializer < ActiveModel::Serializer
  attributes :id, :name, :url, :hit_die, :recommended_stat_one, :recommended_stat_two, :levels
  has_many :proficiencies
  has_many :spell_levels

  def spell_levels
    case self.object.name
    when "Bard"
      spells = SpellLevel.where(dnd_class_id: 2)
    when "Cleric"
      spells = SpellLevel.where(dnd_class_id: 2)
    when "Druid"
      spells = SpellLevel.where(dnd_class_id: 2)
    when "Paladin"
      spells = SpellLevel.where(dnd_class_id: 2)
    when "Ranger"
      spells = SpellLevel.where(dnd_class_id: 2)
    when "Sorcerer"
      spells = SpellLevel.where(dnd_class_id: 2)
    when "Warlock"
      spells = SpellLevel.where(dnd_class_id: 2)
    when "Wizard"
      spells = SpellLevel.where(dnd_class_id: 2)
    when "Barbarian" || "Fighter" || "Monk" || "Rogue"
      spells = nil
    end
    spells
  end


  def levels
    self.object.dnd_class_levels.map { |lvl| 
      generic_level = {level: lvl[:level],features: lvl[:features],ability_score_bonuses: lvl[:ability_score_bonuses],prof_bonus: lvl[:prof_bonus]}
      barbarian_level = {rage_count: lvl[:rage_count],rage_damage_bonus: lvl[:rage_damage_bonus],brutal_critical_dice: lvl[:brutal_critical_dice]}
      bard_level = {bardic_inspiration_die: lvl[:bardic_inspiration_die], song_of_rest_die: lvl[:song_of_rest_die],magical_secrets_max_5: lvl[:magical_secrets_max_5],magical_secrets_max_7: lvl[:magical_secrets_max_7],magical_secrets_max_9: lvl[:magical_secrets_max_9]}
      cleric_level = {channel_divinity_charges: lvl[:channel_divinity_charges],destroy_undead_cr: lvl[:destroy_undead_cr]}
      druid_level = {wild_shape_max_cr: lvl[:wild_shape_max_cr],wild_shape_swim: lvl[:wild_shape_swim],wild_shape_fly: lvl[:wild_shape_fly]}
      fighter_level = {action_surges: lvl[:action_surges],extra_attacks: lvl[:extra_attacks],indomitable_uses: lvl[:indomitable_uses]}
      monk_level = {martial_arts_dice_count: lvl[:martial_arts_dice_count],martial_arts_dice_value: lvl[:martial_arts_dice_value],ki_points: lvl[:ki_points],unarmored_movement: lvl[:unarmored_movement]}
      paladin_level = {aura_range: lvl[:aura_range]}
      ranger_level = {favored_enemies: lvl[:favored_enemies],favored_terrain: lvl[:favored_terrain]}
      rogue_level = {sneak_attack_dice_count: lvl[:sneak_attack_dice_count],sneak_attack_dice_value: lvl[:sneak_attack_dice_value]}
      sorcerer_level = {sorcery_points: lvl[:sorcery_points],metamagic_known: lvl[:metamagic_known],create_lvl_1_slot: lvl[:create_lvl_1_slot],create_lvl_2_slot: lvl[:create_lvl_2_slot],create_lvl_3_slot: lvl[:create_lvl_3_slot],create_lvl_4_slot: lvl[:create_lvl_4_slot],create_lvl_5_slot: lvl[:create_lvl_5_slot]}
      warlock_level = {invocations_known: lvl[:invocations_known],mystic_arcanum_level_6: lvl[:mystic_arcanum_level_6],mystic_arcanum_level_7: lvl[:mystic_arcanum_level_7],mystic_arcanum_level_8: lvl[:mystic_arcanum_level_8],mystic_arcanum_level_9: lvl[:mystic_arcanum_level_9]
      }
      wizard_level = {arcane_recovery_levels: lvl[:arcane_recovery_levels]}
      case self.object.name
      when "Barbarian"
        level = generic_level.merge(barbarian_level)
      when "Bard"
        level = generic_level.merge(bard_level)
      when "Cleric"
        level = generic_level.merge(cleric_level)
      when "Druid"
        level = generic_level.merge(druid_level)
      when "Fighter"
        level = generic_level.merge(fighter_level)
      when "Monk"
        level = generic_level.merge(monk__level)
      when "Paladin"
        level = generic_level.merge(paladin_level)
      when "Ranger"
        level = generic_level.merge(ranger_level)
      when "Rogue"
        level = generic_level.merge(rogue_level)
      when "Sorcerer"
        level = generic_level.merge(sorcerer_level)
      when "Warlock"
        level = generic_level.merge(warlock_level)
      when "Wizard"
        level = generic_level.merge(wizard_level)
      end
      level
    }
  end
end
