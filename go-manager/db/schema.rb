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

ActiveRecord::Schema.define(version: 20160924132618) do

  create_table "appraisal_best_stats", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "appraisal_class", null: false
    t.integer  "min_stat_iv",     null: false
    t.integer  "max_stat_iv",     null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["appraisal_class"], name: "index_appraisal_best_stats_on_appraisal_class", unique: true, using: :btree
  end

  create_table "appraisal_overalls", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "appraisal_class", null: false
    t.integer  "min_total_iv",    null: false
    t.integer  "max_total_iv",    null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["appraisal_class"], name: "index_appraisal_overalls_on_appraisal_class", unique: true, using: :btree
  end

  create_table "monster_evolutions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "slug",       null: false
    t.integer  "monster_id", null: false
    t.integer  "species_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["monster_id", "species_id"], name: "index_monster_evolutions_on_monster_id_and_species_id", unique: true, using: :btree
    t.index ["slug"], name: "index_monster_evolutions_on_slug", unique: true, using: :btree
  end

  create_table "monster_levels", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.decimal  "level",             precision: 6,  scale: 2,  null: false
    t.decimal  "cp_multiplier",     precision: 20, scale: 19, null: false
    t.integer  "dust_to_level_up"
    t.integer  "candy_to_level_up"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.index ["dust_to_level_up"], name: "index_monster_levels_on_dust_to_level_up", using: :btree
    t.index ["level"], name: "index_monster_levels_on_level", unique: true, using: :btree
  end

  create_table "monsters", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "slug",       null: false
    t.string   "name"
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_monsters_on_slug", unique: true, using: :btree
    t.index ["user_id"], name: "index_monsters_on_user_id", using: :btree
  end

  create_table "species", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "species_no",   null: false
    t.string   "name",         null: false
    t.integer  "base_attack",  null: false
    t.integer  "base_defense", null: false
    t.integer  "base_stamina", null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["name"], name: "index_species_on_name", unique: true, using: :btree
    t.index ["species_no"], name: "index_species_on_species_no", unique: true, using: :btree
  end

  create_table "team_leader_appraisal_best_stat_phrases", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "team_leader_id",         null: false
    t.integer  "appraisal_best_stat_id", null: false
    t.string   "phrase",                 null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["phrase"], name: "index_team_leader_appraisal_best_stat_phrases_on_phrase", using: :btree
    t.index ["team_leader_id", "appraisal_best_stat_id"], name: "index_team_leader_appraisal_best_stat_phrases_on_foreign_keys", unique: true, using: :btree
  end

  create_table "team_leader_appraisal_overall_phrases", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "team_leader_id",       null: false
    t.integer  "appraisal_overall_id", null: false
    t.string   "phrase",               null: false
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["phrase"], name: "index_team_leader_appraisal_overall_phrases_on_phrase", using: :btree
    t.index ["team_leader_id", "appraisal_overall_id"], name: "index_team_leader_appraisal_overall_phrases_on_foreign_keys", unique: true, using: :btree
  end

  create_table "team_leaders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       null: false
    t.integer  "team_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_team_leaders_on_name", unique: true, using: :btree
    t.index ["team_id"], name: "index_team_leaders_on_team_id", unique: true, using: :btree
  end

  create_table "teams", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       null: false
    t.string   "color",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["color"], name: "index_teams_on_color", unique: true, using: :btree
    t.index ["name"], name: "index_teams_on_name", unique: true, using: :btree
  end

  create_table "trainer_levels", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "level",            null: false
    t.integer  "total_xp",         null: false
    t.integer  "xp_to_next_level"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["level"], name: "index_trainer_levels_on_level", unique: true, using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "provider",         null: false
    t.string   "uid",              null: false
    t.string   "name"
    t.string   "display_name"
    t.string   "locale"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["display_name"], name: "index_users_on_display_name", unique: true, using: :btree
    t.index ["provider", "uid"], name: "index_users_on_provider_and_uid", unique: true, using: :btree
  end

end
