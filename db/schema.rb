# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150128045422) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "armories", force: true do |t|
    t.integer "character_id"
    t.string  "melee_weapon"
    t.string  "ranged_weapon"
    t.string  "shield"
    t.string  "armor"
  end

  add_index "armories", ["character_id"], name: "index_armories_on_character_id", using: :btree

  create_table "characters", force: true do |t|
    t.string  "name"
    t.integer "race_id"
    t.string  "race_type"
  end

  add_index "characters", ["race_id", "race_type"], name: "index_characters_on_race_id_and_race_type", using: :btree

  create_table "feat_lists", force: true do |t|
    t.string  "feat_1"
    t.string  "feat_2"
    t.string  "feat_3"
    t.integer "character_id"
  end

  add_index "feat_lists", ["character_id"], name: "index_feat_lists_on_character_id", using: :btree

  create_table "fighters", force: true do |t|
  end

  create_table "humen", force: true do |t|
    t.string "ability_bonus"
  end

  create_table "levels", force: true do |t|
    t.integer "character_id"
    t.integer "pf_class_id"
    t.string  "pf_class_type"
  end

  add_index "levels", ["character_id"], name: "index_levels_on_character_id", using: :btree

  create_table "skill_lists", force: true do |t|
    t.integer "character_id"
    t.integer "acrobatics_val"
    t.integer "appraise_val"
    t.integer "bluff_val"
    t.integer "climb_val"
    t.integer "craft_1_val"
    t.string  "craft_1_name"
    t.integer "craft_2_val"
    t.string  "craft_2_name"
    t.integer "craft_3_val"
    t.string  "craft_3_name"
    t.integer "diplomancy_val"
    t.integer "disable_device_val"
    t.integer "disguise_val"
    t.integer "escape_artist_val"
    t.integer "fly_val"
    t.integer "handle_animal_val"
    t.integer "heal_val"
    t.integer "intimidate_val"
    t.integer "knowledge_arcana_val"
    t.integer "knowledge_dungeoneering_val"
    t.integer "knowledge_engineering_val"
    t.integer "knowledge_geography_val"
    t.integer "knowledge_history_val"
    t.integer "knowledge_local_val"
    t.integer "knowledge_nature_val"
    t.integer "knowledge_nobility_val"
    t.integer "knowledge_planes_val"
    t.integer "knowledge_religion_val"
    t.integer "linguistics_val"
    t.integer "perception_val"
    t.integer "perform_1_val"
    t.string  "perform_1_name"
    t.integer "perform_2_val"
    t.string  "perform_2_name"
    t.integer "perform_3_val"
    t.string  "perform_3_name"
    t.integer "profession_val"
    t.string  "profession_name_val"
    t.integer "ride_val"
    t.integer "sense_motive_val"
    t.integer "sleight_of_hand_val"
    t.integer "spellcraft_val"
    t.integer "stealth_val"
    t.integer "survival_val"
    t.integer "swim_val"
    t.integer "use_magic_device_val"
  end

  create_table "stat_blocks", force: true do |t|
    t.integer "wisdom_val"
    t.integer "charisma_val"
    t.integer "constitution_val"
    t.integer "intelligence_val"
    t.integer "strength_val"
    t.integer "dexterity_val"
    t.integer "character_id"
  end

  add_index "stat_blocks", ["character_id"], name: "index_stat_blocks_on_character_id", using: :btree

end
