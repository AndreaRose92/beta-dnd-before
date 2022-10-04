# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_10_04_203848) do
  create_table "character_equips", force: :cascade do |t|
    t.integer "character_id", null: false
    t.integer "equipment_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_character_equips_on_character_id"
    t.index ["equipment_id"], name: "index_character_equips_on_equipment_id"
  end

  create_table "character_feats", force: :cascade do |t|
    t.integer "character_id", null: false
    t.integer "feat_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_character_feats_on_character_id"
    t.index ["feat_id"], name: "index_character_feats_on_feat_id"
  end

  create_table "character_skills", force: :cascade do |t|
    t.integer "character_id", null: false
    t.integer "skill_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_character_skills_on_character_id"
    t.index ["skill_id"], name: "index_character_skills_on_skill_id"
  end

  create_table "character_spells", force: :cascade do |t|
    t.integer "character_id", null: false
    t.integer "spell_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_character_spells_on_character_id"
    t.index ["spell_id"], name: "index_character_spells_on_spell_id"
  end

  create_table "characters", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.integer "level"
    t.integer "dnd_class_id", null: false
    t.integer "race_id", null: false
    t.integer "user_id", null: false
    t.integer "strength", default: 10
    t.integer "dexterity", default: 10
    t.integer "constitution", default: 10
    t.integer "intelligence", default: 10
    t.integer "wisdom", default: 10
    t.integer "charisma", default: 10
    t.integer "max_hp", default: 20
    t.integer "current_hp", default: 20
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dnd_class_id"], name: "index_characters_on_dnd_class_id"
    t.index ["race_id"], name: "index_characters_on_race_id"
    t.index ["user_id"], name: "index_characters_on_user_id"
  end

  create_table "class_equips", force: :cascade do |t|
    t.integer "dnd_class_id", null: false
    t.integer "equipment_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dnd_class_id"], name: "index_class_equips_on_dnd_class_id"
    t.index ["equipment_id"], name: "index_class_equips_on_equipment_id"
  end

  create_table "class_skills", force: :cascade do |t|
    t.integer "dnd_class_id", null: false
    t.integer "skill_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dnd_class_id"], name: "index_class_skills_on_dnd_class_id"
    t.index ["skill_id"], name: "index_class_skills_on_skill_id"
  end

  create_table "class_spells", force: :cascade do |t|
    t.integer "dnd_class_id", null: false
    t.integer "spell_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dnd_class_id"], name: "index_class_spells_on_dnd_class_id"
    t.index ["spell_id"], name: "index_class_spells_on_spell_id"
  end

  create_table "dnd_class_levels", force: :cascade do |t|
    t.integer "dnd_class_id", null: false
    t.string "index"
    t.string "features"
    t.integer "level"
    t.integer "ability_score_bonuses"
    t.integer "prof_bonus"
    t.integer "cantrips_known"
    t.integer "spells_known"
    t.integer "lvl_1_spell_slots"
    t.integer "lvl_2_spell_slots"
    t.integer "lvl_3_spell_slots"
    t.integer "lvl_4_spell_slots"
    t.integer "lvl_5_spell_slots"
    t.integer "lvl_6_spell_slots"
    t.integer "lvl_7_spell_slots"
    t.integer "lvl_8_spell_slots"
    t.integer "lvl_9_spell_slots"
    t.integer "rage_count"
    t.integer "rage_damage_bonus"
    t.integer "brutal_critical_dice"
    t.integer "bardic_inspiration_die"
    t.integer "song_of_rest_die"
    t.integer "magical_secrets_max_5"
    t.integer "magical_secrets_max_7"
    t.integer "magical_secrets_max_9"
    t.integer "channel_divinity_charges"
    t.integer "destroy_undead_cr"
    t.integer "wild_shape_max_cr"
    t.integer "wild_shape_swim"
    t.integer "wild_shape_fly"
    t.integer "action_surges"
    t.integer "indomitable_uses"
    t.integer "extra_attacks"
    t.integer "martial_arts_dice_count"
    t.integer "martial_arts_dice_value"
    t.integer "ki_points"
    t.integer "unarmored_movement"
    t.integer "aura_range"
    t.integer "favored_enemies"
    t.integer "favored_terrain"
    t.integer "sneak_attack_dice_count"
    t.integer "sneak_attack_dice_value"
    t.integer "sorcery_points"
    t.integer "metamagic_known"
    t.integer "create_lvl_1_slot"
    t.integer "create_lvl_2_slot"
    t.integer "create_lvl_3_slot"
    t.integer "create_lvl_4_slot"
    t.integer "create_lvl_5_slot"
    t.integer "invocations_known"
    t.integer "mystic_arcanum_level_6"
    t.integer "mystic_arcanum_level_7"
    t.integer "mystic_arcanum_level_8"
    t.integer "mystic_arcanum_level_9"
    t.integer "arcane_recovery_levels"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dnd_class_id"], name: "index_dnd_class_levels_on_dnd_class_id"
  end

  create_table "dnd_classes", force: :cascade do |t|
    t.string "name"
    t.string "index"
    t.integer "hit_die"
    t.string "recommended_stat_one"
    t.string "recommended_stat_two"
    t.integer "starting_skills"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "equipment", force: :cascade do |t|
    t.string "name"
    t.string "index"
    t.string "weapon_category"
    t.string "weapon_range"
    t.integer "dSize"
    t.integer "dAmt"
    t.integer "modifier"
    t.integer "normal_range"
    t.integer "long_range"
    t.string "damage_type"
    t.string "properties"
    t.string "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "feats", force: :cascade do |t|
    t.string "name"
    t.string "desc"
    t.string "prerequisites"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "features", force: :cascade do |t|
    t.integer "dnd_class_id", null: false
    t.string "name"
    t.string "index"
    t.string "desc"
    t.integer "level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dnd_class_id"], name: "index_features_on_dnd_class_id"
  end

  create_table "race_skills", force: :cascade do |t|
    t.integer "race_id", null: false
    t.integer "skill_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["race_id"], name: "index_race_skills_on_race_id"
    t.index ["skill_id"], name: "index_race_skills_on_skill_id"
  end

  create_table "race_traits", force: :cascade do |t|
    t.integer "race_id", null: false
    t.integer "trait_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["race_id"], name: "index_race_traits_on_race_id"
    t.index ["trait_id"], name: "index_race_traits_on_trait_id"
  end

  create_table "races", force: :cascade do |t|
    t.string "name"
    t.string "index"
    t.string "size"
    t.string "languages"
    t.integer "speed"
    t.integer "strength"
    t.integer "dexterity"
    t.integer "constitution"
    t.integer "intelligence"
    t.integer "wisdom"
    t.integer "charisma"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "skills", force: :cascade do |t|
    t.string "name"
    t.string "stat"
    t.string "desc"
    t.string "index"
    t.boolean "is_save"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "spells", force: :cascade do |t|
    t.string "name"
    t.string "index"
    t.integer "level"
    t.string "desc"
    t.string "higher_level"
    t.string "range"
    t.string "duration"
    t.string "casting_time"
    t.string "dc_type"
    t.string "dc_success"
    t.string "dc_desc"
    t.boolean "ritual"
    t.boolean "concentration"
    t.string "damage_type"
    t.string "slot_lvl_1_damage"
    t.string "slot_lvl_2_damage"
    t.string "slot_lvl_3_damage"
    t.string "slot_lvl_4_damage"
    t.string "slot_lvl_5_damage"
    t.string "slot_lvl_6_damage"
    t.string "slot_lvl_7_damage"
    t.string "slot_lvl_8_damage"
    t.string "slot_lvl_9_damage"
    t.string "char_lvl_1_damage"
    t.string "char_lvl_5_damage"
    t.string "char_lvl_11_damage"
    t.string "char_lvl_17_damage"
    t.string "slot_lvl_1_heal"
    t.string "slot_lvl_2_heal"
    t.string "slot_lvl_3_heal"
    t.string "slot_lvl_4_heal"
    t.string "slot_lvl_5_heal"
    t.string "slot_lvl_6_heal"
    t.string "slot_lvl_7_heal"
    t.string "slot_lvl_8_heal"
    t.string "slot_lvl_9_heal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subclass_levels", force: :cascade do |t|
    t.integer "dnd_class_level_id", null: false
    t.integer "subclass_id", null: false
    t.string "index"
    t.string "subclass_specific"
    t.string "features"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dnd_class_level_id"], name: "index_subclass_levels_on_dnd_class_level_id"
    t.index ["subclass_id"], name: "index_subclass_levels_on_subclass_id"
  end

  create_table "subclasses", force: :cascade do |t|
    t.string "name"
    t.string "flavor"
    t.string "desc"
    t.string "index"
    t.integer "dnd_class_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dnd_class_id"], name: "index_subclasses_on_dnd_class_id"
  end

  create_table "subrace_traits", force: :cascade do |t|
    t.integer "subrace_id", null: false
    t.integer "trait_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subrace_id"], name: "index_subrace_traits_on_subrace_id"
    t.index ["trait_id"], name: "index_subrace_traits_on_trait_id"
  end

  create_table "subraces", force: :cascade do |t|
    t.integer "race_id", null: false
    t.string "name"
    t.string "index"
    t.string "languages"
    t.integer "strength"
    t.integer "dexterity"
    t.integer "constitution"
    t.integer "intelligence"
    t.integer "wisdom"
    t.integer "charisma"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["race_id"], name: "index_subraces_on_race_id"
  end

  create_table "traits", force: :cascade do |t|
    t.string "name"
    t.string "desc"
    t.string "index"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "character_equips", "characters"
  add_foreign_key "character_equips", "equipment"
  add_foreign_key "character_feats", "characters"
  add_foreign_key "character_feats", "feats"
  add_foreign_key "character_skills", "characters"
  add_foreign_key "character_skills", "skills"
  add_foreign_key "character_spells", "characters"
  add_foreign_key "character_spells", "spells"
  add_foreign_key "characters", "dnd_classes"
  add_foreign_key "characters", "races"
  add_foreign_key "characters", "users"
  add_foreign_key "class_equips", "dnd_classes"
  add_foreign_key "class_equips", "equipment"
  add_foreign_key "class_skills", "dnd_classes"
  add_foreign_key "class_skills", "skills"
  add_foreign_key "class_spells", "dnd_classes"
  add_foreign_key "class_spells", "spells"
  add_foreign_key "dnd_class_levels", "dnd_classes"
  add_foreign_key "features", "dnd_classes"
  add_foreign_key "race_skills", "races"
  add_foreign_key "race_skills", "skills"
  add_foreign_key "race_traits", "races"
  add_foreign_key "race_traits", "traits"
  add_foreign_key "subclass_levels", "dnd_class_levels"
  add_foreign_key "subclass_levels", "subclasses"
  add_foreign_key "subclasses", "dnd_classes"
  add_foreign_key "subrace_traits", "subraces"
  add_foreign_key "subrace_traits", "traits"
  add_foreign_key "subraces", "races"
end
