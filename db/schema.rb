# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_10_29_185842) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "animal_shelters", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "name"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.bigint "user_id", null: false
    t.bigint "animal_shelter_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["animal_shelter_id"], name: "index_comments_on_animal_shelter_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "donations", force: :cascade do |t|
    t.float "amount"
    t.string "card_type"
    t.string "card_number"
    t.string "security_code"
    t.string "zipcode"
    t.bigint "animal_shelter_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["animal_shelter_id"], name: "index_donations_on_animal_shelter_id"
    t.index ["user_id"], name: "index_donations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "comments", "animal_shelters"
  add_foreign_key "comments", "users"
  add_foreign_key "donations", "animal_shelters"
  add_foreign_key "donations", "users"
end
