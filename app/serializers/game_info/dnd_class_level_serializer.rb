class DndClassLevelSerializer < ActiveModel::Serializer
  attributes :id, :index, :level, :subclass_levels, :ability_score_bonuses, :prof_bonus, :cantrips_known, :spells_known, :lvl_1_spell_slots, :lvl_2_spell_slots, :lvl_3_spell_slots, :lvl_4_spell_slots, :lvl_5_spell_slots, :lvl_6_spell_slots, :lvl_7_spell_slots, :lvl_8_spell_slots, :lvl_9_spell_slots, :rage_count, :rage_damage_bonus, :brutal_critical_dice, :bardic_inspiration_die, :song_of_rest_die, :magical_secrets_max_5, :magical_secrets_max_7, :magical_secrets_max_9, :channel_divinity_charges, :destroy_undead_cr, :wild_shape_max_cr, :wild_shape_swim, :wild_shape_fly, :action_surges, :indomitable_uses, :extra_attacks, :martial_arts_dice_count, :martial_arts_dice_value, :ki_points, :unarmored_movement, :aura_range, :favored_enemies, :favored_terrain, :sneak_attack_dice_count, :sneak_attack_dice_value, :sorcery_points, :metamagic_known, :create_lvl_1_slot, :create_lvl_2_slot, :create_lvl_3_slot, :create_lvl_4_slot, :create_lvl_5_slot, :warlock_slots, :warlock_slot_level, :invocations_known, :mystic_arcanum_level_6, :mystic_arcanum_level_7, :mystic_arcanum_level_8, :mystic_arcanum_level_9, :arcane_recovery_levels
  # has_many :features, serializer: FeatureSerializer
  # has_many :subclass_levels, serializer: SubclassLevelSerializer

  def subclass_levels
    levels = nil
    if self.object.subclass_levels != []
      levels = self.object.subclass_levels
    end
    levels
  end

  def warlock_slots
    slot = nil
    if self.object.dnd_class.name == "Warlock"
      if self.object.lvl_5_spell_slots > 0
        slot = self.object.lvl_5_spell_slots
      elsif self.object.lvl_4_spell_slots > 0
        slot = self.object.lvl_4_spell_slots
      elsif self.object.lvl_3_spell_slots > 0
        slot = self.object.lvl_3_spell_slots
      elsif self.object.lvl_2_spell_slots > 0
        slot = self.object.lvl_2_spell_slots
      elsif self.object.lvl_1_spell_slots > 0
        slot = self.object.lvl_1_spell_slots
      end
    end
    slot
  end

  def warlock_slot_level
    level = nil
    if self.object.dnd_class.name == "Warlock"
      if self.object.lvl_5_spell_slots > 0
        level = 5
      elsif self.object.lvl_4_spell_slots > 0
        level = 4
      elsif self.object.lvl_3_spell_slots > 0
        level = 3
      elsif self.object.lvl_2_spell_slots > 0
        level = 2
      elsif self.object.lvl_1_spell_slots > 0
        level = 1
      end
    end
    level
  end

  def attributes(*args)
    hash = super
    hash.each { |k, v|
      if v.nil?
        hash.delete(k)
      end
    }
    hash
  end
end
