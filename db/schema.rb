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

ActiveRecord::Schema.define(version: 20161108200239) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "event_work_types", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "work_type_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["event_id"], name: "index_event_work_types_on_event_id", using: :btree
    t.index ["work_type_id"], name: "index_event_work_types_on_work_type_id", using: :btree
  end

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.datetime "date"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "skills", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_roles", force: :cascade do |t|
    t.string   "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "work_times", force: :cascade do |t|
    t.integer  "worker_id"
    t.integer  "event_id"
    t.integer  "work_type_id"
    t.datetime "work_start"
    t.datetime "work_end"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["event_id"], name: "index_work_times_on_event_id", using: :btree
    t.index ["work_type_id"], name: "index_work_times_on_work_type_id", using: :btree
    t.index ["worker_id"], name: "index_work_times_on_worker_id", using: :btree
  end

  create_table "work_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "worker_skills", force: :cascade do |t|
    t.string   "proficiency"
    t.integer  "worker_id"
    t.integer  "skill_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["skill_id"], name: "index_worker_skills_on_skill_id", using: :btree
    t.index ["worker_id"], name: "index_worker_skills_on_worker_id", using: :btree
  end

  create_table "workers", force: :cascade do |t|
    t.string   "username"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.integer  "user_role_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.index ["email"], name: "index_workers_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_workers_on_reset_password_token", unique: true, using: :btree
    t.index ["user_role_id"], name: "index_workers_on_user_role_id", using: :btree
  end

  add_foreign_key "event_work_types", "events"
  add_foreign_key "event_work_types", "work_types"
  add_foreign_key "work_times", "events"
  add_foreign_key "work_times", "work_types"
  add_foreign_key "work_times", "workers"
  add_foreign_key "worker_skills", "skills"
  add_foreign_key "worker_skills", "workers"
  add_foreign_key "workers", "user_roles"
end
