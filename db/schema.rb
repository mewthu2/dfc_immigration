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

ActiveRecord::Schema[7.2].define(version: 2025_02_19_122231) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.bigint "question_id", null: false
    t.text "answer", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_answers_on_customer_id"
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "children", force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.string "full_legal_name", null: false
    t.date "date_of_birth", null: false
    t.string "country_of_birth", null: false
    t.string "alien_registration_number"
    t.boolean "applying_with_customer", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_children_on_customer_id"
  end

  create_table "customers", force: :cascade do |t|
    t.bigint "immigration_plan_id", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.boolean "status", default: false
    t.string "document", null: false
    t.string "gender"
    t.string "ethnicity"
    t.string "race"
    t.date "date_of_birth", null: false
    t.string "birth_city"
    t.string "birth_state"
    t.string "birth_country"
    t.string "phone_number", null: false
    t.string "alien_registration_number"
    t.string "social_security_number"
    t.float "height"
    t.float "weight"
    t.string "eye_color"
    t.string "hair_color"
    t.string "marital_status"
    t.integer "marriage_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_customers_on_email", unique: true
    t.index ["immigration_plan_id"], name: "index_customers_on_immigration_plan_id"
    t.index ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true
  end

  create_table "immigration_plans", force: :cascade do |t|
    t.string "name", null: false
    t.integer "type", default: 0, null: false
    t.decimal "price", precision: 10, scale: 2, null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_immigration_plans_on_name", unique: true
  end

  create_table "parents", force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.string "first_name", null: false
    t.string "middle_name"
    t.string "current_last_name", null: false
    t.string "maiden_name"
    t.date "date_of_birth", null: false
    t.string "birth_city", null: false
    t.string "birth_state"
    t.string "birth_country", null: false
    t.string "current_city", null: false
    t.string "current_country", null: false
    t.integer "parent_type", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_parents_on_customer_id"
  end

  create_table "questionnaires", force: :cascade do |t|
    t.bigint "immigration_plan_id", null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["immigration_plan_id"], name: "index_questionnaires_on_immigration_plan_id"
  end

  create_table "questions", force: :cascade do |t|
    t.bigint "questionnaire_id", null: false
    t.text "text", null: false
    t.string "question_type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["questionnaire_id"], name: "index_questions_on_questionnaire_id"
  end

  create_table "residences", force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.string "street_address", null: false
    t.string "city", null: false
    t.string "state", null: false
    t.string "apt_number"
    t.string "zip_code"
    t.string "country", null: false
    t.date "from_date", null: false
    t.date "to_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_residences_on_customer_id"
  end

  create_table "spouses", force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.string "first_name", null: false
    t.string "middle_name"
    t.string "last_name", null: false
    t.date "date_of_birth", null: false
    t.string "birth_city", null: false
    t.string "birth_state"
    t.string "birth_country", null: false
    t.date "date_of_marriage", null: false
    t.string "place_of_marriage", null: false
    t.date "marriage_end_date"
    t.string "place_of_marriage_end"
    t.boolean "is_active", default: true, null: false
    t.boolean "is_spouse_in_military", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_spouses_on_customer_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["name"], name: "index_users_on_name", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "answers", "customers"
  add_foreign_key "answers", "questions"
  add_foreign_key "children", "customers"
  add_foreign_key "customers", "immigration_plans"
  add_foreign_key "parents", "customers"
  add_foreign_key "questionnaires", "immigration_plans"
  add_foreign_key "questions", "questionnaires"
  add_foreign_key "residences", "customers"
  add_foreign_key "spouses", "customers"
end
