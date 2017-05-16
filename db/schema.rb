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

ActiveRecord::Schema.define(version: 20170516110907) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "locations", force: :cascade do |t|
    t.string   "street",     default: "", null: false
    t.string   "city",       default: "", null: false
    t.integer  "state_id"
    t.string   "country",    default: "", null: false
    t.string   "zip",        default: "", null: false
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["state_id"], name: "index_locations_on_state_id", using: :btree
  end

  create_table "schools", force: :cascade do |t|
    t.string  "name",       limit: 255,                       null: false
    t.integer "phone"
    t.string  "email",      limit: 50
    t.string  "ownership",  limit: 50,  default: "private",   null: false
    t.string  "level",      limit: 50,  default: "secondary", null: false
    t.string  "mode",       limit: 50,  default: "day",       null: false
    t.string  "gender",     limit: 50,  default: "mixed",     null: false
    t.text    "about"
    t.text    "news"
    t.text    "faculties"
    t.text    "staff"
    t.text    "academics"
    t.text    "contact_us"
    t.string  "logo"
    t.string  "banner"
  end

  create_table "states", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "locations_count"
    t.index ["name"], name: "index_states_on_name", unique: true, using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.integer  "role"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
