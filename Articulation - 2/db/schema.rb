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

ActiveRecord::Schema.define(version: 20140506055911) do

  create_table "logins", primary_key: "user_id", force: true do |t|
    t.string   "email"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "submissions", primary_key: "student_id_number", force: true do |t|
    t.string   "name",                 limit: 75,                        null: false
    t.string   "classification",                                         null: false
    t.string   "major",                limit: 20, default: "Undeclared", null: false
    t.string   "address",              limit: 75,                        null: false
    t.string   "email",                limit: 30,                        null: false
    t.string   "phone",                limit: 12,                        null: false
    t.string   "transfer_institution", limit: 50,                        null: false
    t.string   "term",                                                   null: false
    t.string   "course_alpha",                                           null: false
    t.string   "course_number",        limit: 5,                         null: false
    t.integer  "course_hours",         limit: 2,                         null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tbl_administrator", primary_key: "user_id", force: true do |t|
  end

  create_table "tbl_administrators", primary_key: "user_id", force: true do |t|
    t.binary   "approval_flag", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tbl_and_equivalents", primary_key: "articulation_id", force: true do |t|
    t.string   "eq_course_alpha", limit: 10, null: false
    t.string   "eq_course_num",   limit: 10, null: false
    t.string   "course_title",    limit: 50, null: false
    t.integer  "eq_hours",        limit: 8,  null: false
    t.string   "uhh_atr",         limit: 5
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tbl_approves", id: false, force: true do |t|
    t.string   "approval_id",         limit: 10, null: false
    t.string   "user_id",             limit: 8,  null: false
    t.datetime "approval_time_stamp",            null: false
  end

  add_index "tbl_approves", ["user_id"], name: "user_id", using: :btree

  create_table "tbl_equivalent_course", id: false, force: true do |t|
    t.string "approval_id",     limit: 10, default: "", null: false
    t.string "transfer_id",     limit: 10,              null: false
    t.string "eq_course_alpha", limit: 6,               null: false
    t.string "eq_course_num",   limit: 6,               null: false
    t.string "course_title",    limit: 50,              null: false
    t.string "eq_hours",        limit: 5,               null: false
    t.string "conn",            limit: 3
    t.string "uhh_atr",         limit: 5
    t.string "pr",              limit: 1
  end

  add_index "tbl_equivalent_course", ["transfer_id"], name: "transfer_id", using: :btree

  create_table "tbl_equivalent_courses", primary_key: "transfer_id", force: true do |t|
    t.string   "approval_id",     limit: 10, default: "", null: false
    t.string   "eq_course_alpha", limit: 6,               null: false
    t.string   "eq_course_num",   limit: 6,               null: false
    t.string   "course_title",    limit: 50,              null: false
    t.string   "eq_hours",        limit: 5,               null: false
    t.string   "conn",            limit: 3
    t.string   "uhh_atr",         limit: 5
    t.string   "pr",              limit: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tbl_equivalent_courses", ["transfer_id"], name: "transfer_id", using: :btree
  add_index "tbl_equivalent_courses", ["transfer_id"], name: "transfer_id_2", unique: true, using: :btree

  create_table "tbl_institution", primary_key: "institution_name", force: true do |t|
    t.string "city",    limit: 60,  null: false
    t.string "state",   limit: 2,   null: false
    t.string "zip",     limit: 20,  null: false
    t.string "website", limit: 100
  end

  create_table "tbl_institutions", primary_key: "institution_name", force: true do |t|
    t.string   "city",       limit: 60,  null: false
    t.string   "state",      limit: 2,   null: false
    t.string   "zip",        limit: 20,  null: false
    t.string   "website",    limit: 100
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tbl_or_equivalent", id: false, force: true do |t|
    t.string "articulation_id", limit: 10, null: false
    t.string "eq_course_alpha", limit: 10, null: false
    t.string "eq_course_num",   limit: 10, null: false
    t.string "course_title",    limit: 50, null: false
    t.string "eq_hours",        limit: 5,  null: false
    t.string "uhh_atr",         limit: 5
  end

  create_table "tbl_or_equivalents", primary_key: "articulation_id", force: true do |t|
    t.string   "eq_course_alpha", limit: 10, null: false
    t.string   "eq_course_num",   limit: 10, null: false
    t.string   "course_title",    limit: 50, null: false
    t.integer  "eq_hours",        limit: 8,  null: false
    t.string   "uhh_atr",         limit: 5
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tbl_regular_staff", primary_key: "user_id", force: true do |t|
  end

  create_table "tbl_staff", primary_key: "user_id", force: true do |t|
    t.string "department", limit: 50, null: false
    t.string "position",   limit: 9,  null: false
  end

  create_table "tbl_staffs", primary_key: "user_id", force: true do |t|
    t.string   "department", limit: 50, null: false
    t.string   "position",   limit: 9,  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tbl_student", primary_key: "user_id", force: true do |t|
    t.string "major", limit: 100, default: "undeclared", null: false
    t.string "term",  limit: 6,                          null: false
  end

  create_table "tbl_students", primary_key: "user_id", force: true do |t|
    t.string   "major",      limit: 100, default: "undeclared", null: false
    t.string   "term",       limit: 6,                          null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tbl_transfer_course", id: false, force: true do |t|
    t.string "transfer_id",           limit: 10, null: false
    t.string "transfer_course_alpha", limit: 6,  null: false
    t.string "transfer_course_num",   limit: 6,  null: false
    t.string "transfer_inst_name",    limit: 50, null: false
    t.string "course_title",          limit: 50, null: false
    t.string "transfer_hours",        limit: 8,  null: false
    t.string "effective_term",        limit: 6,  null: false
    t.string "grp",                   limit: 1
  end

  add_index "tbl_transfer_course", ["transfer_inst_name"], name: "transfer_inst_name", using: :btree

  create_table "tbl_transfer_courses", primary_key: "transfer_id", force: true do |t|
    t.string   "transfer_course_alpha", limit: 6,  null: false
    t.string   "transfer_course_num",   limit: 6,  null: false
    t.string   "course_title",          limit: 50, null: false
    t.string   "transfer_inst_name",    limit: 50, null: false
    t.string   "transfer_hours",        limit: 8,  null: false
    t.string   "effective_term",        limit: 6,  null: false
    t.string   "grp",                   limit: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tbl_transfers_in", id: false, force: true do |t|
    t.string   "user_id",               limit: 8,  null: false
    t.string   "transfer_course_alpha", limit: 6,  null: false
    t.string   "transfer_course_num",   limit: 6,  null: false
    t.string   "transfer_inst_name",    limit: 50, null: false
    t.datetime "submission_time_stamp",            null: false
  end

  add_index "tbl_transfers_in", ["transfer_inst_name"], name: "transfer_inst_name", using: :btree

  create_table "tbl_transfers_ins", primary_key: "user_id", force: true do |t|
    t.string   "transfer_course_alpha", limit: 6,  null: false
    t.string   "transfer_course_num",   limit: 6,  null: false
    t.string   "transfer_inst_name",    limit: 50, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tbl_user", primary_key: "user_id", force: true do |t|
    t.string "first_name",      limit: 50, null: false
    t.string "middle_initital", limit: 1
    t.string "last_name",       limit: 50, null: false
    t.string "phone",           limit: 10, null: false
    t.string "email",           limit: 25, null: false
  end

  create_table "tbl_users", primary_key: "user_id", force: true do |t|
    t.string   "first_name",     limit: 50, null: false
    t.string   "middle_initial", limit: 1
    t.string   "last_name",      limit: 50, null: false
    t.string   "phone",          limit: 10, null: false
    t.string   "email",          limit: 25, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "first_name",            limit: 50,                  null: false
    t.string   "middle_initial",        limit: 1
    t.string   "last_name",             limit: 50,                  null: false
    t.string   "email",                 limit: 25,                  null: false
    t.string   "password",              limit: 25, default: "\"\"", null: false
    t.string   "password_confirmation", limit: 25, default: "\"\"", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin"
  end

  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

end
