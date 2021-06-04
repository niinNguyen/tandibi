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

ActiveRecord::Schema.define(version: 2021_06_04_084004) do

  create_table "bonds", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "friend_id", null: false
    t.string "state", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id", "friend_id"], name: "index_bonds_on_user_id_and_friend_id", unique: true
  end

  create_table "pictures", force: :cascade do |t|
    t.integer "post_id", null: false
    t.string "caption"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "places", force: :cascade do |t|
    t.string "locale", null: false
    t.string "coordinate", null: false
    t.string "name"
    t.string "place_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["coordinate"], name: "index_places_on_coordinate"
    t.index ["locale", "coordinate"], name: "index_places_on_locale_and_coordinate", unique: true
    t.index ["locale"], name: "index_places_on_locale"
  end

  create_table "posts", force: :cascade do |t|
    t.integer "user_id"
    t.integer "thread_id"
    t.string "postable_type", null: false
    t.integer "postable_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["postable_type", "postable_id"], name: "index_posts_on_postable"
  end

  create_table "sights", force: :cascade do |t|
    t.integer "place_id", null: false
    t.string "activity_type", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["place_id"], name: "index_sights_on_place_id"
  end

  create_table "statuses", force: :cascade do |t|
    t.string "text", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.string "first_name", null: false
    t.string "last_name"
    t.string "email", null: false
    t.boolean "is_public", default: true, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "bonds", "users"
  add_foreign_key "bonds", "users", column: "friend_id"
  add_foreign_key "pictures", "posts"
  add_foreign_key "posts", "posts", column: "thread_id"
  add_foreign_key "posts", "users"
  add_foreign_key "sights", "places"
end
