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

ActiveRecord::Schema.define(version: 20170219215401) do

  create_table "cities", force: :cascade do |t|
    t.string  "name",       null: false
    t.integer "country_id", null: false
    t.index ["country_id", "name"], name: "index_cities_on_country_id_and_name", unique: true
    t.index ["country_id"], name: "index_cities_on_country_id"
    t.index ["name"], name: "index_cities_on_name"
  end

  create_table "conference_users", force: :cascade do |t|
    t.integer  "conference_id",                      null: false
    t.integer  "user_id",                            null: false
    t.integer  "rank",                               null: false
    t.boolean  "confirmed",          default: false, null: false
    t.string   "confirmation_token",                 null: false
    t.datetime "confirmation_date"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.index ["conference_id", "user_id", "confirmed"], name: "idx_cid_uid_conf"
    t.index ["conference_id", "user_id"], name: "idx_unique_cid_uid", unique: true
    t.index ["conference_id"], name: "index_conference_users_on_conference_id"
    t.index ["confirmation_date"], name: "index_conference_users_on_confirmation_date"
    t.index ["confirmed"], name: "index_conference_users_on_confirmed"
    t.index ["created_at"], name: "index_conference_users_on_created_at"
    t.index ["rank"], name: "index_conference_users_on_rank"
    t.index ["user_id"], name: "index_conference_users_on_user_id"
  end

  create_table "conferences", force: :cascade do |t|
    t.integer  "host_id",    null: false
    t.integer  "place_id",   null: false
    t.datetime "starts_at",  null: false
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["host_id"], name: "index_conferences_on_host_id"
    t.index ["place_id"], name: "index_conferences_on_place_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name", null: false
  end

  create_table "places", force: :cascade do |t|
    t.integer "city_id",   null: false
    t.string  "street"
    t.float   "latitude"
    t.float   "longitude"
    t.index ["city_id"], name: "index_places_on_city_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  null: false
    t.string   "encrypted_password",     null: false
    t.string   "first_name",             null: false
    t.string   "last_name",              null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["first_name"], name: "index_users_on_first_name"
    t.index ["last_name"], name: "index_users_on_last_name"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
