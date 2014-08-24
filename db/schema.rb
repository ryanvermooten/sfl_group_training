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

ActiveRecord::Schema.define(version: 20140824174236) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attendance_registers", force: true do |t|
    t.integer  "training_session_id"
    t.boolean  "attended"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "group_id"
  end

  create_table "attendance_registers_gardeners", force: true do |t|
    t.integer "attendance_register_id"
    t.integer "gardener_id"
  end

  create_table "attendance_registers_training_sessions", force: true do |t|
    t.integer "attendance_register_id"
    t.integer "training_session_id"
    t.integer "gardener_id"
  end

  create_table "delayed_jobs", force: true do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "gardeners", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "contact_number"
    t.string   "address"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "id_number",                            limit: 8
    t.string   "state"
    t.string   "status"
    t.boolean  "garden_at_home"
    t.string   "garden_location"
    t.integer  "garden_size_l"
    t.integer  "garden_size_w"
    t.string   "maritial_status"
    t.integer  "living_arrangements"
    t.string   "joining_details_referral"
    t.string   "joining_details_referral_qualitative"
    t.string   "joining_details_potential_growth"
    t.string   "education_levels"
    t.string   "education_levels_other"
    t.boolean  "employment"
    t.string   "employment_type"
    t.string   "earning_power"
    t.boolean  "grant"
    t.string   "grant_type"
    t.string   "grant_amount"
    t.string   "access_to_water"
    t.boolean  "gardening_tools"
    t.string   "gardening_tools_qualitative"
    t.boolean  "other_organizations"
    t.string   "other_organizations_qualitative"
    t.boolean  "help_received"
    t.string   "help_received_qualitative"
    t.boolean  "previous_experience"
    t.string   "previous_experience_qualitative"
    t.boolean  "currently_growing"
    t.string   "currently_growing_neg"
    t.string   "grown_veg_usage"
    t.string   "grown_veg_other_qualitative"
    t.string   "veg_bought"
    t.string   "veg_expenditure"
    t.integer  "diet_food_intake"
    t.integer  "diet_veg_intake"
    t.string   "diet_general_health"
    t.string   "diet_health_issues"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "resume_file_name"
    t.string   "resume_content_type"
    t.integer  "resume_file_size"
    t.datetime "resume_updated_at"
  end

  add_index "gardeners", ["group_id"], name: "index_gardeners_on_group_id", using: :btree

  create_table "groups", force: true do |t|
    t.string   "group_name"
    t.string   "area"
    t.integer  "user_id"
    t.integer  "avatar"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "group_picture_file_name"
    t.string   "group_picture_content_type"
    t.integer  "group_picture_file_size"
    t.datetime "group_picture_updated_at"
  end

  create_table "training_sessions", force: true do |t|
    t.integer  "attendance_registers_id"
    t.string   "name"
    t.integer  "date_held"
    t.datetime "created_at"
    t.datetime "updated_at"
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
    t.string   "name"
    t.integer  "role"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
