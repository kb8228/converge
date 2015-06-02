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

ActiveRecord::Schema.define(version: 20150601023124) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "establishments", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "phone_number"
    t.text     "hours"
    t.string   "image_url"
    t.string   "category"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "invitees", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone_number"
    t.integer  "meetup_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "invitees", ["meetup_id"], name: "index_invitees_on_meetup_id", using: :btree

  create_table "locations", force: :cascade do |t|
    t.string   "address"
    t.float    "lat"
    t.float    "lng"
    t.integer  "user_id"
    t.integer  "invitee_id"
    t.integer  "meetup_id"
    t.integer  "establishment_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "locations", ["establishment_id"], name: "index_locations_on_establishment_id", using: :btree
  add_index "locations", ["invitee_id"], name: "index_locations_on_invitee_id", using: :btree
  add_index "locations", ["meetup_id"], name: "index_locations_on_meetup_id", using: :btree
  add_index "locations", ["user_id"], name: "index_locations_on_user_id", using: :btree

  create_table "meetups", force: :cascade do |t|
    t.date     "date"
    t.time     "time"
    t.integer  "user_id"
    t.integer  "establishment_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "meetups", ["establishment_id"], name: "index_meetups_on_establishment_id", using: :btree
  add_index "meetups", ["user_id"], name: "index_meetups_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone_number"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "token"
  end

  add_foreign_key "invitees", "meetups"
  add_foreign_key "locations", "establishments"
  add_foreign_key "locations", "invitees"
  add_foreign_key "locations", "meetups"
  add_foreign_key "locations", "users"
  add_foreign_key "meetups", "establishments"
  add_foreign_key "meetups", "users"
end
