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

ActiveRecord::Schema[7.0].define(version: 2022_09_21_153502) do
  create_table "barbarians", force: :cascade do |t|
    t.integer "level"
    t.integer "ability_score_bonuseslity_score_bonuses"
    t.integer "prof_bonus"
    t.string "features"
    t.string "class_specific"
    t.string "spells"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bards", force: :cascade do |t|
    t.integer "level"
    t.integer "ability_score_bonuses"
    t.integer "prof_bonus"
    t.string "features"
    t.string "class_specific"
    t.string "spells"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "char_skills", force: :cascade do |t|
    t.integer "character_id", null: false
    t.integer "proficiency_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_char_skills_on_character_id"
    t.index ["proficiency_id"], name: "index_char_skills_on_proficiency_id"
  end

  create_table "characters", force: :cascade do |t|
    t.string "name"
    t.integer "user_id", null: false
    t.integer "dnd_class_id", null: false
    t.integer "race_id", null: false
    t.integer "strength"
    t.integer "dexterity"
    t.integer "constitution"
    t.integer "intelligence"
    t.integer "wisdom"
    t.integer "charisma"
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

  create_table "clerics", force: :cascade do |t|
    t.integer "level"
    t.integer "ability_score_bonuses"
    t.integer "prof_bonus"
    t.string "features"
    t.string "class_specific"
    t.string "spells"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dnd_classes", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "druids", force: :cascade do |t|
    t.integer "level"
    t.integer "ability_score_bonuses"
    t.integer "prof_bonus"
    t.string "features"
    t.string "class_specific"
    t.string "spells"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "equipment", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "feats", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fighters", force: :cascade do |t|
    t.integer "level"
    t.integer "ability_score_bonuses"
    t.integer "prof_bonus"
    t.string "features"
    t.string "class_specific"
    t.string "spells"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "monks", force: :cascade do |t|
    t.integer "level"
    t.integer "ability_score_bonuses"
    t.integer "prof_bonus"
    t.string "features"
    t.string "class_specific"
    t.string "spells"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "paladins", force: :cascade do |t|
    t.integer "level"
    t.integer "ability_score_bonuses"
    t.integer "prof_bonus"
    t.string "features"
    t.string "class_specific"
    t.string "spells"
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rangers", force: :cascade do |t|
    t.integer "level"
    t.integer "ability_score_bonuses"
    t.integer "prof_bonus"
    t.string "features"
    t.string "class_specific"
    t.string "spells"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rogues", force: :cascade do |t|
    t.integer "level"
    t.integer "ability_score_bonuses"
    t.integer "prof_bonus"
    t.string "features"
    t.string "class_specific"
    t.string "spells"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sorcerers", force: :cascade do |t|
    t.integer "level"
    t.integer "ability_score_bonuses"
    t.integer "prof_bonus"
    t.string "features"
    t.string "class_specific"
    t.string "spells"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "warlocks", force: :cascade do |t|
    t.integer "level"
    t.integer "ability_score_bonuses"
    t.integer "prof_bonus"
    t.string "features"
    t.string "class_specific"
    t.string "spells"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wizards", force: :cascade do |t|
    t.integer "level"
    t.integer "ability_score_bonuses"
    t.integer "prof_bonus"
    t.string "features"
    t.string "class_specific"
    t.string "spells"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "char_skills", "characters"
  add_foreign_key "char_skills", "proficiencies"
  add_foreign_key "characters", "dnd_classes"
  add_foreign_key "characters", "races"
  add_foreign_key "characters", "users"
  add_foreign_key "class_skills", "dnd_classes"
  add_foreign_key "class_skills", "proficiencies"
  add_foreign_key "race_skills", "proficiencies"
  add_foreign_key "race_skills", "races"
end
