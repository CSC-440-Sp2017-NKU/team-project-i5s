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

ActiveRecord::Schema.define(version: 20170404213044) do

  create_table "answers", force: :cascade do |t|
    t.string   "text"
    t.boolean  "active",      default: true
    t.integer  "user_id"
    t.integer  "question_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["question_id"], name: "index_answers_on_question_id"
    t.index ["user_id"], name: "index_answers_on_user_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string   "course_name"
    t.integer  "program_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["program_id"], name: "index_courses_on_program_id"
  end

  create_table "forums", force: :cascade do |t|
    t.string   "forum_name"
    t.string   "forum_description"
    t.string   "resource_url"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "keywords", force: :cascade do |t|
    t.string   "keyword"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "programs", force: :cascade do |t|
    t.string   "program_name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "question_keywords", force: :cascade do |t|
    t.integer  "question_id"
    t.integer  "keyword_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["keyword_id"], name: "index_question_keywords_on_keyword_id"
    t.index ["question_id"], name: "index_question_keywords_on_question_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string   "title"
    t.string   "text"
    t.boolean  "active",     default: true
    t.integer  "user_id"
    t.integer  "forum_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["forum_id"], name: "index_questions_on_forum_id"
    t.index ["user_id"], name: "index_questions_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string   "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sections", force: :cascade do |t|
    t.integer  "semester_id"
    t.integer  "course_id"
    t.integer  "user_id"
    t.datetime "created_at",                                                            null: false
    t.datetime "updated_at",                                                            null: false
    t.string   "section_name"
    t.index ["course_id"], name: "index_sections_on_course_id"
    t.index ["semester_id"], name: "index_sections_on_semester_id"
    t.index ["user_id"], name: "index_sections_on_user_id"
  end

  create_table "semesters", force: :cascade do |t|
    t.integer  "academic_year"
    t.string   "session"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "student_sections", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "section_id"
    t.integer  "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_student_sections_on_course_id"
    t.index ["section_id"], name: "index_student_sections_on_section_id"
    t.index ["user_id"], name: "index_student_sections_on_user_id"
  end

  create_table "user_files", force: :cascade do |t|
    t.string   "resource_text"
    t.string   "resource_url"
    t.binary   "attached_file"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["user_id"], name: "index_user_files_on_user_id"
  end

  create_table "user_sessions", force: :cascade do |t|
    t.string   "session_id", null: false
    t.text     "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["session_id"], name: "index_user_sessions_on_session_id"
    t.index ["updated_at"], name: "index_user_sessions_on_updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "user_name",           default: "",         null: false
    t.integer  "role_id",             default: 2
    t.string   "login",               default: "",         null: false
    t.string   "crypted_password",    default: "12345678", null: false
    t.string   "password_salt",       default: "",         null: false
    t.string   "email",               default: "",         null: false
    t.string   "persistence_token",   default: "",         null: false
    t.string   "single_access_token", default: "",         null: false
    t.string   "perishable_token",    default: "",         null: false
    t.integer  "login_count",         default: 0,          null: false
    t.integer  "failed_login_count",  default: 0,          null: false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  create_table "votes", force: :cascade do |t|
    t.integer  "direction"
    t.integer  "answers_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["answers_id"], name: "index_votes_on_answers_id"
    t.index ["user_id"], name: "index_votes_on_user_id"
  end

end
