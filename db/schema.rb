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

ActiveRecord::Schema.define(version: 20131219132251) do

  create_table "audits", force: true do |t|
    t.integer  "log_level",  limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "available_activities", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clients", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "daily_sheets", force: true do |t|
    t.integer  "monthly_sheet_id"
    t.string   "day"
    t.date     "date",             limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "departments", force: true do |t|
    t.string   "name"
    t.integer  "division_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "divisions", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "monthly_sheets", force: true do |t|
    t.date     "month"
    t.integer  "user_id"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "reason"
  end

  create_table "projects", force: true do |t|
    t.integer  "client_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tasks", force: true do |t|
    t.integer  "number_of_hours"
    t.string   "task_type"
    t.integer  "user_id"
    t.integer  "project_id"
    t.string   "description"
    t.integer  "daily_sheet_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "activity"
  end

  create_table "users", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "roles_mask"
    t.integer  "department_id"
    t.string   "internal_id"
    t.string   "first_name"
    t.string   "last_name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["internal_id"], name: "index_users_on_internal_id", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "vacantions", force: true do |t|
    t.string   "type"
    t.integer  "user_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
