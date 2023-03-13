# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_03_13_021054) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "audit_logs", force: :cascade do |t|
    t.string "model_class"
    t.bigint "model_id"
    t.string "action"
    t.string "changelog"
    t.bigint "company_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_audit_logs_on_company_id"
    t.index ["user_id"], name: "index_audit_logs_on_user_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "company_users", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_company_users_on_company_id"
    t.index ["user_id"], name: "index_company_users_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.bigint "user_id", null: false
    t.bigint "project_id", null: false
    t.string "title"
    t.string "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_posts_on_company_id"
    t.index ["project_id"], name: "index_posts_on_project_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "project_stakeholders", force: :cascade do |t|
    t.bigint "project_id", null: false
    t.bigint "stakeholder_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_project_stakeholders_on_project_id"
    t.index ["stakeholder_id"], name: "index_project_stakeholders_on_stakeholder_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.bigint "company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_projects_on_company_id"
  end

  create_table "stakeholders", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "audit_logs", "companies"
  add_foreign_key "audit_logs", "users"
  add_foreign_key "company_users", "companies"
  add_foreign_key "company_users", "users"
  add_foreign_key "posts", "companies"
  add_foreign_key "posts", "projects"
  add_foreign_key "posts", "users"
  add_foreign_key "project_stakeholders", "projects"
  add_foreign_key "project_stakeholders", "stakeholders"
  add_foreign_key "projects", "companies"
end
