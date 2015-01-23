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

ActiveRecord::Schema.define(version: 20150123073617) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "characters", force: true do |t|
    t.string  "name"
    t.integer "race_id"
    t.string  "race_type"
  end

  add_index "characters", ["race_id", "race_type"], name: "index_characters_on_race_id_and_race_type", using: :btree

  create_table "fighters", force: true do |t|
  end

  create_table "humen", force: true do |t|
  end

  create_table "levels", force: true do |t|
    t.integer "character_id"
    t.integer "pf_class_id"
    t.string  "pf_class_type"
  end

  add_index "levels", ["character_id"], name: "index_levels_on_character_id", using: :btree

  create_table "mods", force: true do |t|
    t.string  "role"
    t.string  "trait"
    t.integer "modifier"
    t.integer "source_id"
    t.string  "source_type"
    t.integer "character_id"
  end

  add_index "mods", ["character_id"], name: "index_mods_on_character_id", using: :btree

  create_table "skill_lists", force: true do |t|
    t.integer "character_id"
    t.integer "acrobatics"
    t.integer "appraise"
    t.integer "bluff"
    t.integer "climb"
    t.integer "craft_1"
    t.string  "craft_1_name"
    t.integer "craft_2"
    t.string  "craft_2_name"
    t.integer "craft_3"
    t.string  "craft_3_name"
    t.integer "diplomancy"
    t.integer "disable_device"
    t.integer "disguise"
    t.integer "escape_artist"
    t.integer "fly"
    t.integer "handle_animal"
    t.integer "heal"
    t.integer "intimidate"
    t.integer "knowledge_arcana"
    t.integer "knowledge_dungeoneering"
    t.integer "knowledge_engineering"
    t.integer "knowledge_geography"
    t.integer "knowledge_history"
    t.integer "knowledge_local"
    t.integer "knowledge_nature"
    t.integer "knowledge_nobility"
    t.integer "knowledge_planes"
    t.integer "knowledge_religion"
    t.integer "linguistics"
    t.integer "perception"
    t.integer "perform_1"
    t.string  "perform_1_name"
    t.integer "perform_2"
    t.string  "perform_2_name"
    t.integer "perform_3"
    t.string  "perform_3_name"
    t.integer "profession"
    t.string  "profession_name"
    t.integer "ride"
    t.integer "sense_motive"
    t.integer "sleight_of_hand"
    t.integer "spellcraft"
    t.integer "stealth"
    t.integer "survival"
    t.integer "swim"
    t.integer "use_magic_device"
  end

  create_table "stat_blocks", force: true do |t|
    t.integer "wisdom"
    t.integer "charisma"
    t.integer "constitution"
    t.integer "intelligence"
    t.integer "strength"
    t.integer "dexterity"
    t.integer "character_id"
  end

  add_index "stat_blocks", ["character_id"], name: "index_stat_blocks_on_character_id", using: :btree

end
