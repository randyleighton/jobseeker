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

ActiveRecord::Schema.define(version: 20141101221205) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: true do |t|
    t.string "name"
  end

  create_table "contacts", force: true do |t|
    t.string  "first_name"
    t.string  "last_name"
    t.string  "email"
    t.integer "cell"
    t.integer "work_number"
    t.integer "company_id"
  end

  add_index "contacts", ["company_id"], name: "index_contacts_on_company_id", using: :btree

  create_table "job_applications", force: true do |t|
    t.date    "applied_date"
    t.integer "contacts_id"
    t.integer "jobs_id"
  end

  add_index "job_applications", ["contacts_id"], name: "index_job_applications_on_contacts_id", using: :btree
  add_index "job_applications", ["jobs_id"], name: "index_job_applications_on_jobs_id", using: :btree

  create_table "jobs", force: true do |t|
    t.string  "description"
    t.string  "location"
    t.string  "posting_number"
    t.integer "companies_id"
  end

  add_index "jobs", ["companies_id"], name: "index_jobs_on_companies_id", using: :btree

end
