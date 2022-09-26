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

ActiveRecord::Schema[7.0].define(version: 2022_09_26_133406) do
  create_table "char_skills", force: :cascade do |t|
    t.integer "character_id", null: false
    t.integer "proficiency_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_char_skills_on_character_id"
    t.index ["proficiency_id"], name: "index_char_skills_on_proficiency_id"
  end

  create_table "char_spells", force: :cascade do |t|
    t.integer "character_id", null: false
    t.integer "spell_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_char_spells_on_character_id"
    t.index ["spell_id"], name: "index_char_spells_on_spell_id"
  end

  create_table "characters", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.integer "level"
    t.integer "user_id", null: false
    t.integer "dnd_class_id", null: false
    t.integer "race_id", null: false
    t.integer "Strength"
    t.integer "Dexterity"
    t.integer "Constitution"
    t.integer "Intelligence"
    t.integer "Wisdom"
    t.integer "Charisma"
    t.integer "hp"
    t.integer "current_hp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dnd_class_id"], name: "index_characters_on_dnd_class_id"
    t.index ["race_id"], name: "index_characters_on_race_id"
    t.index ["user_id"], name: "index_characters_on_user_id"
  end

  create_table "class_skills", force: :cascade do |t|
    t.integer "dnd_class_id", null: false
    t.integer "proficiency_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dnd_class_id"], name: "index_class_skills_on_dnd_class_id"
    t.index ["proficiency_id"], name: "index_class_skills_on_proficiency_id"
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
    t.string "features"
    t.integer "level"
    t.integer "ability_score_bonuses"
    t.integer "prof_bonus"
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
    t.boolean "wild_shape_swim"
    t.boolean "wild_shape_fly"
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
    t.string "url"
    t.integer "hit_die"
    t.string "recommended_stat_one"
    t.string "recommended_stat_two"
    t.integer "starting_proficiencies"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "equipment", force: :cascade do |t|
    t.string "name"
    t.string "weapon_type"
    t.integer "dSize"
    t.integer "dAmt"
    t.string "damage_type"
    t.string "properties"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "feats", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "proficiencies", force: :cascade do |t|
    t.string "name"
    t.string "stat"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "race_skills", force: :cascade do |t|
    t.integer "race_id", null: false
    t.integer "proficiency_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["proficiency_id"], name: "index_race_skills_on_proficiency_id"
    t.index ["race_id"], name: "index_race_skills_on_race_id"
  end

  create_table "races", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.string "ability_score_bonuses"
    t.string "size"
    t.string "languages"
    t.string "traits"
    t.integer "speed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "spell_levels", force: :cascade do |t|
    t.integer "dnd_class_id", null: false
    t.integer "cantrips_known"
    t.integer "spells_known"
    t.integer "lvl_1"
    t.integer "lvl_2"
    t.integer "lvl_3"
    t.integer "lvl_4"
    t.integer "lvl_5"
    t.integer "lvl_6"
    t.integer "lvl_7"
    t.integer "lvl_8"
    t.integer "lvl_9"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dnd_class_id"], name: "index_spell_levels_on_dnd_class_id"
  end

  create_table "spells", force: :cascade do |t|
    t.string "name"
    t.string "desc"
    t.string "higher_level"
    t.string "range"
    t.boolean "ritual"
    t.string "duration"
    t.boolean "concentration"
    t.integer "level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subraces", force: :cascade do |t|
    t.integer "dnd_class_id", null: false
    t.string "name"
    t.integer "race_id", null: false
    t.string "url"
    t.string "ability_score_bonuses"
    t.string "languages"
    t.string "traits"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dnd_class_id"], name: "index_subraces_on_dnd_class_id"
    t.index ["race_id"], name: "index_subraces_on_race_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "char_skills", "characters"
  add_foreign_key "char_skills", "proficiencies"
  add_foreign_key "char_spells", "characters"
  add_foreign_key "char_spells", "spells"
  add_foreign_key "characters", "dnd_classes"
  add_foreign_key "characters", "races"
  add_foreign_key "characters", "users"
  add_foreign_key "class_skills", "dnd_classes"
  add_foreign_key "class_skills", "proficiencies"
  add_foreign_key "class_spells", "dnd_classes"
  add_foreign_key "class_spells", "spells"
  add_foreign_key "dnd_class_levels", "dnd_classes"
  add_foreign_key "race_skills", "proficiencies"
  add_foreign_key "race_skills", "races"
  add_foreign_key "spell_levels", "dnd_classes"
  add_foreign_key "subraces", "dnd_classes"
  add_foreign_key "subraces", "races"
end
