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

ActiveRecord::Schema.define(version: 2022_11_06_213225) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "everyday_behaviors", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "behaviors_one", null: false
    t.string "behaviors_two", null: false
    t.string "behaviors_three", null: false
    t.string "behaviors_four", null: false
    t.string "behaviors_five", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_everyday_behaviors_on_user_id"
  end

  create_table "subordinates", force: :cascade do |t|
    t.string "name", null: false
    t.string "email"
    t.date "birthday"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_subordinates_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "everyday_behaviors", "users"
  add_foreign_key "subordinates", "users"
end
