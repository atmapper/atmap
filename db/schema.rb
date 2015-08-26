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

ActiveRecord::Schema.define(version: 20150824144054) do

  create_table "clips", force: :cascade do |t|
    t.integer  "mapid",       limit: 4
    t.integer  "regist_user", limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string   "value",       limit: 255
    t.integer  "mapid",       limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "regist_user", limit: 4
    t.integer  "warn",        limit: 1
  end

  create_table "maps", force: :cascade do |t|
    t.string   "body",        limit: 255
    t.integer  "clean",       limit: 1
    t.integer  "famous",      limit: 1
    t.integer  "infoseek",    limit: 1
    t.string   "mapname",     limit: 255
    t.decimal  "lat",                     precision: 10, scale: 6
    t.decimal  "lgn",                     precision: 10, scale: 6
    t.integer  "kind",        limit: 4
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.integer  "regist_user", limit: 4
    t.string   "memo",        limit: 255
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.string   "password_digest", limit: 255
    t.string   "email",           limit: 255
    t.string   "auth",            limit: 255
    t.integer  "startflg",        limit: 1
    t.integer  "deleteflg",       limit: 1
    t.integer  "pref",            limit: 1
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "mm",              limit: 1
  end

end
