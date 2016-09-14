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

ActiveRecord::Schema.define(version: 20160914164950) do

  create_table "appraisal_individual_phrases", force: :cascade do |t|
    t.string   "phrase"
    t.integer  "min_individual_iv"
    t.integer  "max_individual_iv"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "team_leader_id"
  end

  create_table "appraisal_overall_phrases", force: :cascade do |t|
    t.string   "phrase"
    t.integer  "min_total_iv"
    t.integer  "max_total_iv"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "team_leader_id"
  end

  create_table "levels_data", force: :cascade do |t|
    t.decimal  "level",                precision: 6,  scale: 2
    t.decimal  "cp_multiplier",        precision: 20, scale: 19
    t.integer  "stardust_to_power_up"
    t.integer  "candy_to_power_up"
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.index ["level"], name: "index_levels_data_on_level", unique: true
    t.index ["stardust_to_power_up"], name: "index_levels_data_on_stardust_to_power_up", unique: true
  end

  create_table "monster_appraisals", force: :cascade do |t|
    t.integer  "monster_id"
    t.boolean  "attack_best"
    t.boolean  "defense_best"
    t.boolean  "stamina_best"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "appraisal_individual_phrase_id"
    t.integer  "appraisal_overall_phrase_id"
  end

  create_table "monster_evolutions", force: :cascade do |t|
    t.integer  "monster_id"
    t.integer  "species_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "monster_levels", force: :cascade do |t|
    t.integer  "cp"
    t.integer  "hp"
    t.integer  "dust_to_power_up"
    t.boolean  "never_powered_up"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "monster_evolution_id"
  end

  create_table "monster_possible_ivs", force: :cascade do |t|
    t.integer  "monster_id"
    t.integer  "level_id"
    t.integer  "attack"
    t.integer  "defense"
    t.integer  "stamina"
    t.integer  "maxed_cp"
    t.integer  "maxed_hp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "monster_summaries", force: :cascade do |t|
    t.integer  "min_attack_iv"
    t.integer  "max_attack_iv"
    t.integer  "min_defense_iv"
    t.integer  "min_stamina_iv"
    t.integer  "max_stamina_iv"
    t.integer  "min_maxed_cp"
    t.integer  "max_maxed_cp"
    t.integer  "min_maxed_hp"
    t.integer  "max_maxed_hp"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "monster_id"
  end

  create_table "monsters", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "trainer_id"
  end

  create_table "species", force: :cascade do |t|
    t.integer  "species_no"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_species_on_name", unique: true
    t.index ["species_no"], name: "index_species_on_species_no", unique: true
  end

  create_table "species_base_stats", force: :cascade do |t|
    t.integer  "species_id"
    t.integer  "base_attack"
    t.integer  "base_defense"
    t.integer  "base_stamina"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "team_leaders", force: :cascade do |t|
    t.string   "name"
    t.integer  "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.string   "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trainers", force: :cascade do |t|
    t.string   "name"
    t.integer  "current_level"
    t.integer  "team_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

end
