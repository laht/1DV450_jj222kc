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

ActiveRecord::Schema.define(version: 20140206183032) do

  create_table "api_keys", force: true do |t|
    t.integer  "auth_token", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "applications", force: true do |t|
    t.string   "contact_mail", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "licenses", force: true do |t|
    t.string   "license_type", limit: 100
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "resource_types", force: true do |t|
    t.string   "resource_type", limit: 100
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "resources", force: true do |t|
    t.integer  "resource_type_id"
    t.integer  "user_id"
    t.integer  "license_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tags", force: true do |t|
    t.string   "tag",        limit: 50
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "firstname",  limit: 30
    t.string   "lastname",   limit: 30
    t.string   "email",      limit: 70, default: ""
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
