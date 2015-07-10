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

ActiveRecord::Schema.define(version: 20150707230255) do

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
    t.integer "deity_id"
    t.string  "deity_name"
  end

  add_index "characters", ["race_id", "race_type"], name: "index_characters_on_race_id_and_race_type", using: :btree

  create_table "clerics", force: true do |t|
  end

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
    t.integer "acrobatics_val",              default: 0
    t.integer "appraise_val",                default: 0
    t.integer "bluff_val",                   default: 0
    t.integer "climb_val",                   default: 0
    t.integer "craft_1_val",                 default: 0
    t.string  "craft_1_name",                default: ""
    t.integer "craft_2_val",                 default: 0
    t.string  "craft_2_name",                default: ""
    t.integer "craft_3_val",                 default: 0
    t.string  "craft_3_name",                default: ""
    t.integer "diplomancy_val",              default: 0
    t.integer "disable_device_val",          default: 0
    t.integer "disguise_val",                default: 0
    t.integer "escape_artist_val",           default: 0
    t.integer "fly_val",                     default: 0
    t.integer "handle_animal_val",           default: 0
    t.integer "heal_val",                    default: 0
    t.integer "intimidate_val",              default: 0
    t.integer "knowledge_arcana_val",        default: 0
    t.integer "knowledge_dungeoneering_val", default: 0
    t.integer "knowledge_engineering_val",   default: 0
    t.integer "knowledge_geography_val",     default: 0
    t.integer "knowledge_history_val",       default: 0
    t.integer "knowledge_local_val",         default: 0
    t.integer "knowledge_nature_val",        default: 0
    t.integer "knowledge_nobility_val",      default: 0
    t.integer "knowledge_planes_val",        default: 0
    t.integer "knowledge_religion_val",      default: 0
    t.integer "linguistics_val",             default: 0
    t.integer "perception_val",              default: 0
    t.integer "perform_1_val",               default: 0
    t.string  "perform_1_name",              default: ""
    t.integer "perform_2_val",               default: 0
    t.string  "perform_2_name",              default: ""
    t.integer "perform_3_val",               default: 0
    t.string  "perform_3_name",              default: ""
    t.integer "profession_val",              default: 0
    t.string  "profession_name_val",         default: ""
    t.integer "ride_val",                    default: 0
    t.integer "sense_motive_val",            default: 0
    t.integer "sleight_of_hand_val",         default: 0
    t.integer "spellcraft_val",              default: 0
    t.integer "stealth_val",                 default: 0
    t.integer "survival_val",                default: 0
    t.integer "swim_val",                    default: 0
    t.integer "use_magic_device_val",        default: 0
  end

  create_table "stat_blocks", force: true do |t|
    t.integer "wisdom_val",       default: 0
    t.integer "charisma_val",     default: 0
    t.integer "constitution_val", default: 0
    t.integer "intelligence_val", default: 0
    t.integer "strength_val",     default: 0
    t.integer "dexterity_val",    default: 0
    t.integer "character_id"
  end

  add_index "stat_blocks", ["character_id"], name: "index_stat_blocks_on_character_id", using: :btree

end
