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

ActiveRecord::Schema.define(version: 2018_05_29_003448) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "hstore"
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "email", limit: 255
    t.string "password_digest", limit: 255
    t.string "user_type"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_accounts_on_email"
    t.index ["user_type", "user_id"], name: "index_accounts_on_user_type_and_user_id"
  end

  create_table "applicants", force: :cascade do |t|
    t.string "first_name", limit: 255, null: false
    t.string "last_name", limit: 255, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employers", force: :cascade do |t|
    t.string "logo_url", limit: 255
    t.string "name", limit: 255, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_employers_on_name"
  end

  create_table "job_applications", force: :cascade do |t|
    t.bigint "applicant_id"
    t.bigint "job_id"
    t.hstore "experiences", default: {}
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["applicant_id"], name: "index_job_applications_on_applicant_id"
    t.index ["job_id"], name: "index_job_applications_on_job_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.string "title", limit: 255, null: false
    t.text "description", null: false
    t.text "qualifications", default: [], null: false, array: true
    t.text "experiences", default: [], null: false, array: true
    t.text "benefits", default: [], null: false, array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "employer_id"
    t.index ["employer_id"], name: "index_jobs_on_employer_id"
  end

  add_foreign_key "job_applications", "applicants"
  add_foreign_key "job_applications", "jobs"
  add_foreign_key "jobs", "employers"
end
