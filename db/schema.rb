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

ActiveRecord::Schema[7.1].define(version: 2023_11_17_191616) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "collections", force: :cascade do |t|
    t.string "title"
    t.text "desc"
    t.string "image_url"
    t.integer "category_id"
    t.integer "user_id"
    t.string "custom_string1_name"
    t.boolean "custom_string1_enabled"
    t.string "custom_string2_name"
    t.boolean "custom_string2_enabled"
    t.string "custom_string3_name"
    t.boolean "custom_string3_enabled"
    t.string "custom_text1_name"
    t.boolean "custom_text1_enabled"
    t.string "custom_text2_name"
    t.boolean "custom_text2_enabled"
    t.string "custom_text3_name"
    t.boolean "custom_text3_enabled"
    t.string "custom_int1_name"
    t.boolean "custom_int1_enabled"
    t.string "custom_int2_name"
    t.boolean "custom_int2_enabled"
    t.string "custom_int3_name"
    t.boolean "custom_int3_enabled"
    t.string "custom_bool1_name"
    t.boolean "custom_bool1_enabled"
    t.string "custom_bool2_name"
    t.boolean "custom_bool2_enabled"
    t.string "custom_bool3_name"
    t.boolean "custom_bool3_enabled"
    t.string "custom_date1_name"
    t.boolean "custom_date1_enabled"
    t.string "custom_date2_name"
    t.boolean "custom_date2_enabled"
    t.string "custom_date3_name"
    t.boolean "custom_date3_enabled"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.boolean "blocked"
    t.string "avatar"
    t.boolean "admin", default: false
  end

  add_foreign_key "collections", "categories"
  add_foreign_key "collections", "users"
end
