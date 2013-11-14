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

ActiveRecord::Schema.define(version: 20131114100732) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "groups", force: true do |t|
    t.string   "group_name"
    t.string   "group_desc"
    t.string   "homebase_location"
    t.string   "group_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "address_street"
    t.integer  "address_zipcode"
    t.string   "address_state"
    t.integer  "creator_id"
  end

  create_table "groups_tasks", force: true do |t|
    t.integer "group_id"
    t.integer "task_id"
  end

  create_table "groups_users", force: true do |t|
    t.integer "group_id"
    t.integer "user_id"
  end

  create_table "tasks", force: true do |t|
    t.string   "name"
    t.string   "desc"
    t.string   "start_location"
    t.string   "destination_location"
    t.string   "end_location"
    t.integer  "estimated_time"
    t.integer  "total_time"
    t.boolean  "started"
    t.boolean  "completed"
    t.integer  "creator_id"
    t.integer  "owner_id"
    t.integer  "passes"
    t.integer  "group_id"
    t.string   "priority"
    t.string   "category"
    t.integer  "karma_value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "accepted_at_time"
    t.integer  "completed_at_time"
    t.integer  "cost"
    t.integer  "flaker_id"
    t.integer  "due_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "username"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "nickname"
    t.string   "role"
    t.string   "phone_num"
    t.string   "prof_pic"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "tot_karma"
    t.integer  "tot_flakes"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
