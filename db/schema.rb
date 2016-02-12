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

ActiveRecord::Schema.define(version: 20160211183223) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "reports", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.string   "tags",                           array: true
    t.datetime "time"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "room_id"
    t.integer  "student_report_id"
  end

  add_index "reports", ["room_id"], name: "index_reports_on_room_id", using: :btree
  add_index "reports", ["student_report_id"], name: "index_reports_on_student_report_id", using: :btree

  create_table "rooms", force: :cascade do |t|
    t.string   "name"
    t.string   "hex_color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "student_reports", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "report_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "student_reports", ["report_id"], name: "index_student_reports_on_report_id", using: :btree
  add_index "student_reports", ["student_id"], name: "index_student_reports_on_student_id", using: :btree

  create_table "students", force: :cascade do |t|
    t.string   "name"
    t.date     "dob"
    t.json     "contacts"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "room_id"
    t.integer  "student_report_id"
  end

  add_index "students", ["room_id"], name: "index_students_on_room_id", using: :btree
  add_index "students", ["student_report_id"], name: "index_students_on_student_report_id", using: :btree

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "auth_token",             default: ""
  end

  add_index "users", ["auth_token"], name: "index_users_on_auth_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "reports", "rooms"
  add_foreign_key "reports", "student_reports"
  add_foreign_key "students", "rooms"
  add_foreign_key "students", "student_reports"
end
