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

ActiveRecord::Schema[7.0].define(version: 2023_06_30_075848) do
  create_table "groups", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", limit: 45
  end

  create_table "jwt_denylist", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "jti", null: false
    t.datetime "exp", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["jti"], name: "index_jwt_denylist_on_jti"
  end

  create_table "lessons", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "subject_id"
    t.string "day", limit: 45
    t.integer "number"
    t.time "time"
    t.index ["subject_id"], name: "fk_lessons_1_idx"
  end

  create_table "marks", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", limit: 45
    t.integer "task_id"
    t.datetime "deadline", precision: nil
    t.index ["task_id"], name: "fk_marks_1_idx"
  end

  create_table "subjects", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", limit: 45
    t.string "description", limit: 45
  end

  create_table "tasks", id: :integer, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", limit: 45
    t.integer "user_id"
    t.datetime "deadline", precision: nil
    t.string "description", limit: 45
    t.text "solution"
    t.integer "subject_id"
    t.index ["subject_id"], name: "fk_tasks_1_idx1"
    t.index ["user_id"], name: "fk_tasks_1_idx"
  end

  create_table "users", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "first_name", limit: 45
    t.string "last_name", limit: 45
    t.integer "group_id"
    t.string "role", limit: 45
    t.string "email", default: "", null: false
    t.string "description", limit: 45
    t.string "country", limit: 45, collation: "cp1256_general_ci"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "email_UNIQUE", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["group_id"], name: "fk_users_1_idx"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "lessons", "subjects", name: "fk_lessons_1"
  add_foreign_key "marks", "tasks", name: "fk_marks_1"
  add_foreign_key "tasks", "subjects", name: "fk_tasks_1"
  add_foreign_key "tasks", "users", name: "fk_tasks_2"
  add_foreign_key "users", "groups", name: "fk_users_1"
end
