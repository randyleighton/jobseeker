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

ActiveRecord::Schema.define(version: 20150115233618) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string  "account_type"
    t.string  "account_info"
    t.integer "contact_id"
    t.integer "user_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.text     "url"
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "one_step_id"
    t.integer  "user_id"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "phone"
    t.string   "email"
    t.string   "country"
  end

  add_index "companies", ["one_step_id"], name: "index_companies_on_one_step_id", using: :btree

  create_table "contacts", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "title"
    t.string   "email"
    t.string   "cell_phone"
    t.string   "work_phone"
    t.text     "notes"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "contacts", ["company_id"], name: "index_contacts_on_company_id", using: :btree

  create_table "contacts_interviews", force: :cascade do |t|
    t.integer "contact_id"
    t.integer "interview_id"
  end

  add_index "contacts_interviews", ["contact_id"], name: "index_contacts_interviews_on_contact_id", using: :btree
  add_index "contacts_interviews", ["interview_id"], name: "index_contacts_interviews_on_interview_id", using: :btree

  create_table "feedbacks", force: :cascade do |t|
    t.string   "subject"
    t.text     "body"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "sender_name"
    t.string   "sender_email"
  end

  create_table "followups", force: :cascade do |t|
    t.integer  "follow_id"
    t.string   "follow_type"
    t.string   "action"
    t.text     "notes"
    t.date     "action_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "interviews", force: :cascade do |t|
    t.date     "interview_date"
    t.text     "notes"
    t.integer  "job_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.time     "interview_time"
  end

  add_index "interviews", ["job_id"], name: "index_interviews_on_job_id", using: :btree

  create_table "jobs", force: :cascade do |t|
    t.text     "description"
    t.string   "location"
    t.text     "posting_url"
    t.date     "application_date"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "status"
  end

  add_index "jobs", ["company_id"], name: "index_jobs_on_company_id", using: :btree

  create_table "one_steps", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reminders", force: :cascade do |t|
    t.string   "subject"
    t.string   "body"
    t.date     "due_date"
    t.integer  "rem_id"
    t.string   "rem_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.boolean  "email"
  end

  create_table "responses", force: :cascade do |t|
    t.text     "notes"
    t.date     "response_date"
    t.integer  "job_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "contact_id"
  end

  add_index "responses", ["job_id"], name: "index_responses_on_job_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
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
    t.string   "username"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "contacts_interviews", "contacts"
  add_foreign_key "contacts_interviews", "interviews"
end
