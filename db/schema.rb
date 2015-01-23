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

ActiveRecord::Schema.define(version: 20150123002241) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "characters", force: true do |t|
    t.string "name"
  end

  create_table "fighters", force: true do |t|
  end

  create_table "mods", force: true do |t|
    t.string  "role"
    t.string  "trait"
    t.integer "modifier"
    t.integer "source_id"
    t.string  "source_type"
    t.integer "character_id"
  end

  add_index "mods", ["character_id"], name: "index_mods_on_character_id", using: :btree

  create_table "pf_classes", force: true do |t|
    t.integer "character_id"
  end

  add_index "pf_classes", ["character_id"], name: "index_pf_classes_on_character_id", using: :btree

end
