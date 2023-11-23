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

ActiveRecord::Schema[7.1].define(version: 2023_11_23_175831) do
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
    t.string "custom_string1_name", default: ""
    t.boolean "custom_string1_enabled", default: false
    t.string "custom_string2_name", default: ""
    t.boolean "custom_string2_enabled", default: false
    t.string "custom_string3_name", default: ""
    t.boolean "custom_string3_enabled", default: false
    t.string "custom_text1_name", default: ""
    t.boolean "custom_text1_enabled", default: false
    t.string "custom_text2_name", default: ""
    t.boolean "custom_text2_enabled", default: false
    t.string "custom_text3_name", default: ""
    t.boolean "custom_text3_enabled", default: false
    t.string "custom_int1_name", default: ""
    t.boolean "custom_int1_enabled", default: false
    t.string "custom_int2_name", default: ""
    t.boolean "custom_int2_enabled", default: false
    t.string "custom_int3_name", default: ""
    t.boolean "custom_int3_enabled", default: false
    t.string "custom_bool1_name", default: ""
    t.boolean "custom_bool1_enabled", default: false
    t.string "custom_bool2_name", default: ""
    t.boolean "custom_bool2_enabled", default: false
    t.string "custom_bool3_name", default: ""
    t.boolean "custom_bool3_enabled", default: false
    t.string "custom_date1_name", default: ""
    t.boolean "custom_date1_enabled", default: false
    t.string "custom_date2_name", default: ""
    t.boolean "custom_date2_enabled", default: false
    t.string "custom_date3_name", default: ""
    t.boolean "custom_date3_enabled", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "item_tags", force: :cascade do |t|
    t.integer "tag_id"
    t.integer "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string "title"
    t.integer "user_id"
    t.integer "collection_id"
    t.string "custom_string1"
    t.string "custom_string2"
    t.string "custom_string3"
    t.text "custom_text1"
    t.text "custom_text2"
    t.text "custom_text3"
    t.integer "custom_int1"
    t.integer "custom_int2"
    t.integer "custom_int3"
    t.boolean "custom_bool1"
    t.boolean "custom_bool2"
    t.boolean "custom_bool3"
    t.date "custom_date1"
    t.date "custom_date2"
    t.date "custom_date3"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "likes", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_likes_on_item_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "title"
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
  add_foreign_key "item_tags", "items"
  add_foreign_key "item_tags", "tags"
  add_foreign_key "items", "collections"
  add_foreign_key "items", "users"
  add_foreign_key "likes", "items"
  add_foreign_key "likes", "users"
end
