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

ActiveRecord::Schema.define(version: 20150218104917) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "boats", force: true do |t|
    t.string   "boat_image"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "bookings", force: true do |t|
    t.text     "comment"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "dealconfirmation"
    t.integer  "berthbooked"
    t.integer  "journey_id"
    t.integer  "user_id"
  end

  create_table "journeys", force: true do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.float    "start_port_latitude"
    t.float    "end_port_latitude"
    t.string   "start_address"
    t.string   "start_city"
    t.string   "country"
    t.string   "end_address"
    t.string   "end_city"
    t.string   "title"
    t.text     "description"
    t.string   "deal"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "berth"
    t.float    "start_port_longitude"
    t.float    "end_port_longitude"
    t.integer  "boat_id"
    t.integer  "captain_id"
    t.integer  "journey_berth_booked"
    t.integer  "available_berths"
  end

  create_table "ratings", force: true do |t|
    t.integer  "rating"
    t.text     "review"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "booking_id"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "role"
    t.float    "current_latitude"
    t.float    "current_longitude"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "user_image"
    t.text     "about_me"
    t.float    "average_rating"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
