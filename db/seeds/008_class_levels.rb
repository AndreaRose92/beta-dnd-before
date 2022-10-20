require "./db/reference_data.rb"

SubclassLevel.destroy_all
SubclassLevel.reset_pk_sequence
DndClassLevel.destroy_all
DndClassLevel.reset_pk_sequence

DndClass.all.each do |dc|
  20.times do |c|
    level_data = JSON.parse(RestClient.get("#{$api_url}/classes/#{dc.index}/levels/#{c + 1}"))
    spellcasting = level_data["spellcasting"] ? level_data["spellcasting"] : nil
    specifics = level_data["class_specific"]

    def filter_features(name, data)
      case name
      when "Barbarian"
        features = data["features"].pluck("name").delete_if { |v| v.include?("Brutal") }
        features.size > 0 ? features = features.join(", ") : features = nil
      when "Bard"
        features = data["features"].pluck("name").delete_if { |v| v.include?("Bard") || v.include?("Song") }
        features.size > 0 ? features = features.join(", ") : features = nil
      when "Cleric"
        features = data["features"].pluck("name").delete_if { |v| v.include?("Channel") || v.include?("Destroy") || v.include?("Cleric") }
        features.size > 0 ? features = features.join(", ") : features = nil
      when "Druid"
        features = data["features"].pluck("name").delete_if { |v| v.include?("Wild") || v.include?("Druid") }
        features.size > 0 ? features = features.join(", ") : features = nil
      when "Fighter"
        features = data["features"].pluck("name").delete_if { |v| v.include?("Extra") || v.include?("Action") || v.include?("Indomitable") }
        features.size > 0 ? features = features.join(", ") : features = nil
      when "Monk"
        features = data["features"].pluck("name").delete_if { |v| v.include?("Martial") || v.include?("Unarmored") }
        features.size > 0 ? features = features.join(", ") : features = nil
      when "Paladin"
        features = data["features"].pluck("name").delete_if { |v| v.include?("Paladin") }
        features.size > 0 ? features = features.join(", ") : features = nil
      when "Ranger"
        features = data["features"].pluck("name").delete_if { |v| v.include?("Favored") || v.include?("Ranger") || v.include?("Natural") }
        features.size > 0 ? features = features.join(", ") : features = nil
      when "Rogue"
        features = data["features"].pluck("name").delete_if { |v| v.include?("Sneak") }
        features.size > 0 ? features = features.join(", ") : features = nil
      when "Sorcerer"
        features = data["features"].pluck("name").delete_if { |v| v.include?("Sorcerer") || v.include?("Flexible") || v.include?("Metamagic") }
        features.size > 0 ? features = features.join(", ") : features = nil
      when "Warlock"
        features = data["features"].pluck("name").delete_if { |v| v.include?("Mystic") || v.include?("Eldritch") }
        features.size > 0 ? features = features.join(", ") : features = nil
      when "Wizard"
        features = data["features"].pluck("name").delete_if { |v| v.include?("Wizard") || v.include?("Arcane") }
        features.size > 0 ? features = features.join(", ") : features = nil
      end
      features
    end

    new_level = DndClassLevel.create!(
      dnd_class: dc,
      index: level_data["index"],
      level: level_data["level"],
      feature_names: filter_features(dc.name, level_data),
      ability_score_bonuses: level_data["ability_score_bonuses"],
      prof_bonus: level_data["prof_bonus"],
      cantrips_known: spellcasting && spellcasting["cantrips_known"] ? spellcasting["cantrips_known"] : nil,
      spells_known: spellcasting && spellcasting["spells_known"] ? spellcasting["spells_known"] : nil,
      lvl_1_spell_slots: spellcasting && spellcasting["spell_slots_level_1"] ? spellcasting["spell_slots_level_1"] : nil,
      lvl_2_spell_slots: spellcasting && spellcasting["spell_slots_level_2"] ? spellcasting["spell_slots_level_2"] : nil,
      lvl_3_spell_slots: spellcasting && spellcasting["spell_slots_level_3"] ? spellcasting["spell_slots_level_3"] : nil,
      lvl_4_spell_slots: spellcasting && spellcasting["spell_slots_level_4"] ? spellcasting["spell_slots_level_4"] : nil,
      lvl_5_spell_slots: spellcasting && spellcasting["spell_slots_level_5"] ? spellcasting["spell_slots_level_5"] : nil,
      lvl_6_spell_slots: spellcasting && spellcasting["spell_slots_level_6"] ? spellcasting["spell_slots_level_6"] : nil,
      lvl_7_spell_slots: spellcasting && spellcasting["spell_slots_level_7"] ? spellcasting["spell_slots_level_7"] : nil,
      lvl_8_spell_slots: spellcasting && spellcasting["spell_slots_level_8"] ? spellcasting["spell_slots_level_8"] : nil,
      lvl_9_spell_slots: spellcasting && spellcasting["spell_slots_level_9"] ? spellcasting["spell_slots_level_9"] : nil,
      rage_count: specifics["rage_count"] ? specifics["rage_count"] : nil,
      rage_damage_bonus: specifics["rage_damage_bonus"] ? specifics["rage_damage_bonus"] : nil,
      brutal_critical_dice: specifics["brutal_critical_dice"] ? specifics["brutal_critical_dice"] : nil,
      bardic_inspiration_die: specifics["bardic_inspiration_die"] ? specifics["bardic_inspiration_die"] : nil,
      song_of_rest_die: specifics["song_of_rest_die"] ? specifics["song_of_rest_die"] : nil,
      magical_secrets_max_5: specifics["magical_secrets_max_5"] ? specifics["magical_secrets_max_5"] : nil,
      magical_secrets_max_7: specifics["magical_secrets_max_7"] ? specifics["magical_secrets_max_7"] : nil,
      magical_secrets_max_9: specifics["magical_secrets_max_9"] ? specifics["magical_secrets_max_9"] : nil,
      channel_divinity_charges: specifics["channel_divinity_charges"] ? specifics["channel_divinity_charges"] : nil,
      destroy_undead_cr: specifics["destroy_undead_cr"] ? specifics["destroy_undead_cr"] : nil,
      wild_shape_max_cr: specifics["wild_shape_max_cr"] ? specifics["wild_shape_max_cr"] : nil,
      wild_shape_swim: specifics["wild_shape_swim"] ? specifics["wild_shape_swim"] : nil,
      wild_shape_fly: specifics["wild_shape_fly"] ? specifics["wild_shape_fly"] : nil,
      action_surges: specifics["action_surges"] ? specifics["action_surges"] : nil,
      indomitable_uses: specifics["indomitable_uses"] ? specifics["indomitable_uses"] : nil,
      extra_attacks: specifics["extra_attacks"] ? specifics["extra_attacks"] : nil,
      martial_arts_dice_count: specifics["martial_arts"] ? specifics["martial_arts"]["dice_count"] : nil,
      martial_arts_dice_value: specifics["martial_arts"] ? specifics["martial_arts"]["dice_value"] : nil,
      ki_points: specifics["ki_points"] ? specifics["ki_points"] : nil,
      unarmored_movement: specifics["unarmored_movement"] ? specifics["unarmored_movement"] : nil,
      aura_range: specifics["aura_range"] ? specifics["aura_range"] : nil,
      favored_enemies: specifics["favored_enemies"] ? specifics["favored_enemies"] : nil,
      favored_terrain: specifics["favored_terrain"] ? specifics["favored_terrain"] : nil,
      sneak_attack_dice_count: specifics["sneak_attack"] ? specifics["sneak_attack"]["dice_count"] : nil,
      sneak_attack_dice_value: specifics["sneak_attack"] ? specifics["sneak_attack"]["dice_value"] : nil,
      sorcery_points: specifics["sorcery_points"] ? specifics["sorcery_points"] : nil,
      metamagic_known: specifics["metamagic_known"] ? specifics["metamagic_known"] : nil,
      create_lvl_1_slot: specifics["create_lvl_1_slot"] ? specifics["create_lvl_1_slot"] : nil,
      create_lvl_2_slot: specifics["create_lvl_2_slot"] ? specifics["create_lvl_2_slot"] : nil,
      create_lvl_3_slot: specifics["create_lvl_3_slot"] ? specifics["create_lvl_3_slot"] : nil,
      create_lvl_4_slot: specifics["create_lvl_4_slot"] ? specifics["create_lvl_4_slot"] : nil,
      create_lvl_5_slot: specifics["create_lvl_5_slot"] ? specifics["create_lvl_5_slot"] : nil,
      invocations_known: specifics["invocations_known"] ? specifics["invocations_known"] : nil,
      mystic_arcanum_level_6: specifics["mystic_arcanum_level_6"] ? specifics["mystic_arcanum_level_6"] : nil,
      mystic_arcanum_level_7: specifics["mystic_arcanum_level_7"] ? specifics["mystic_arcanum_level_7"] : nil,
      mystic_arcanum_level_8: specifics["mystic_arcanum_level_8"] ? specifics["mystic_arcanum_level_8"] : nil,
      mystic_arcanum_level_9: specifics["mystic_arcanum_level_9"] ? specifics["mystic_arcanum_level_9"] : nil,
      arcane_recovery_levels: specifics["arcane_recovery_levels"] ? specifics["arcane_recovery_levels"] : nil,
    )
  end
end

Subclass.all.each do |subclass|
  subclass_levels = JSON.parse(RestClient.get("#{$api_url}/subclasses/#{subclass.index}/levels"))

  subclass_levels.each do |level|
    if level["subclass_specific"]
      specs = "#{level["subclass_specific"].keys[0]}: #{level["subclass_specific"].values[0]}"
    else
      specs = nil
    end

    SubclassLevel.create!(
      dnd_class_level: DndClassLevel.find_by(dnd_class: subclass.dnd_class, level: level["level"]),
      subclass: subclass,
      feature_names: stringify_fetch(level["features"]),
      subclass_specific: specs,
      index: level["index"],
    )
  end
end
