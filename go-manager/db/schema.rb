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

ActiveRecord::Schema.define(version: 20160917012019) do

  create_table "appraisal_best_stats", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "appraisal_class"
    t.integer  "min_stat_iv"
    t.integer  "max_stat_iv"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["appraisal_class"], name: "index_appraisal_best_stats_on_appraisal_class", unique: true, using: :btree
  end

  create_table "appraisal_overalls", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "appraisal_class"
    t.integer  "min_total_iv"
    t.integer  "max_total_iv"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["appraisal_class"], name: "index_appraisal_overalls_on_appraisal_class", unique: true, using: :btree
  end

  create_table "team_leader_appraisal_best_stat_phrases", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "team_leader_id"
    t.integer  "appraisal_best_stat_id"
    t.string   "phrase"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["phrase"], name: "index_team_leader_appraisal_best_stat_phrases_on_phrase", unique: true, using: :btree
    t.index ["team_leader_id", "appraisal_best_stat_id"], name: "index_team_leader_appraisal_best_stat_phrases_on_foreign_keys", unique: true, using: :btree
  end

  create_table "team_leader_appraisal_overall_phrases", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "team_leader_id"
    t.integer  "appraisal_overall_id"
    t.string   "phrase"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["phrase"], name: "index_team_leader_appraisal_overall_phrases_on_phrase", unique: true, using: :btree
    t.index ["team_leader_id", "appraisal_overall_id"], name: "index_team_leader_appraisal_overall_phrases_on_foreign_keys", unique: true, using: :btree
  end

  create_table "team_leaders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "team_id"
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
    t.index ["color"], name: "index_team_on_color", unique: true, using: :btree
    t.index ["name"], name: "index_team_on_name", unique: true, using: :btree
  end

end
