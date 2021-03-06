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

ActiveRecord::Schema.define(version: 20160327094224) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "achievements", force: :cascade do |t|
    t.integer  "course_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "name"
    t.text     "description"
    t.string   "icon_id"
  end

  add_index "achievements", ["course_id"], name: "index_achievements_on_course_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "course_paths", force: :cascade do |t|
    t.integer  "course_id"
    t.integer  "path_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "course_paths", ["course_id"], name: "index_course_paths_on_course_id", using: :btree
  add_index "course_paths", ["path_id"], name: "index_course_paths_on_path_id", using: :btree

  create_table "courses", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "category_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "image_uid"
    t.integer  "user_id"
    t.string   "github_clone_link"
  end

  add_index "courses", ["category_id"], name: "index_courses_on_category_id", using: :btree
  add_index "courses", ["user_id"], name: "index_courses_on_user_id", using: :btree

  create_table "enrollments", force: :cascade do |t|
    t.integer  "progress"
    t.integer  "course_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "enrollments", ["course_id"], name: "index_enrollments_on_course_id", using: :btree
  add_index "enrollments", ["user_id"], name: "index_enrollments_on_user_id", using: :btree

  create_table "homework_payments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "homework_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "homework_payments", ["homework_id"], name: "index_homework_payments_on_homework_id", using: :btree
  add_index "homework_payments", ["user_id"], name: "index_homework_payments_on_user_id", using: :btree

  create_table "homeworks", force: :cascade do |t|
    t.string   "link"
    t.decimal  "price"
    t.integer  "section_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "homeworks", ["section_id"], name: "index_homeworks_on_section_id", using: :btree

  create_table "paths", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "creator_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "sections", force: :cascade do |t|
    t.integer  "number"
    t.string   "videourl"
    t.text     "content"
    t.integer  "course_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "title"
    t.string   "homework_description"
    t.decimal  "price"
  end

  add_index "sections", ["course_id"], name: "index_sections_on_course_id", using: :btree

  create_table "user_achievements", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "achievement_id"
    t.boolean  "is_unlocked"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "user_course_storages", force: :cascade do |t|
    t.integer  "course_id"
    t.integer  "user_id"
    t.text     "json_data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "image"
    t.string   "name"
    t.string   "authentication_token"
  end

  add_index "users", ["authentication_token"], name: "index_users_on_authentication_token", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "achievements", "courses"
  add_foreign_key "course_paths", "courses"
  add_foreign_key "courses", "categories"
  add_foreign_key "courses", "users"
  add_foreign_key "enrollments", "courses"
  add_foreign_key "enrollments", "users"
  add_foreign_key "homework_payments", "homeworks"
  add_foreign_key "homework_payments", "users"
  add_foreign_key "homeworks", "sections"
  add_foreign_key "sections", "courses"
end
