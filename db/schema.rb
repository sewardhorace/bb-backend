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

ActiveRecord::Schema.define(version: 20151215042010) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "reports", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.string   "tags",                     array: true
    t.datetime "time"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "room_id"
  end

  add_index "reports", ["room_id"], name: "index_reports_on_room_id", using: :btree

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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "room_id"
  end

  add_index "students", ["room_id"], name: "index_students_on_room_id", using: :btree

  add_foreign_key "reports", "rooms"
  add_foreign_key "students", "rooms"
end
