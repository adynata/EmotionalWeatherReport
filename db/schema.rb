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

ActiveRecord::Schema.define(version: 20150730214738) do

  create_table "authorizations", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "feels", force: :cascade do |t|
    t.string   "feel",       null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "feels", ["user_id"], name: "index_feels_on_user_id"

  create_table "forecasts", force: :cascade do |t|
    t.string   "location",        null: false
    t.date     "date",            null: false
    t.time     "sunrise",         null: false
    t.time     "sunset",          null: false
    t.string   "conditions",      null: false
    t.string   "conditions_desc", null: false
    t.string   "current_temp",    null: false
    t.string   "low_temp",        null: false
    t.string   "high_temp",       null: false
    t.string   "humidity",        null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",   null: false
    t.string   "location",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "email"
    t.string   "fname"
    t.string   "lname"
  end

end
