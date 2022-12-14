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

ActiveRecord::Schema.define(version: 2022_12_09_003126) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "communications", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "subordinate_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["subordinate_id"], name: "index_communications_on_subordinate_id"
    t.index ["user_id", "subordinate_id"], name: "index_communications_on_user_id_and_subordinate_id", unique: true
    t.index ["user_id"], name: "index_communications_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "name", limit: 100, null: false
    t.datetime "start", null: false
    t.datetime "end", null: false
    t.boolean "timed", default: true
    t.text "description"
    t.string "color"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_events_on_user_id"
  end

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

  create_table "places", force: :cascade do |t|
    t.text "place_point", null: false
    t.bigint "user_id", null: false
    t.bigint "subordinate_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["subordinate_id"], name: "index_places_on_subordinate_id"
    t.index ["user_id"], name: "index_places_on_user_id"
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
    t.string "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.integer "access_count_to_reset_password_page", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "communications", "subordinates"
  add_foreign_key "communications", "users"
  add_foreign_key "events", "users"
  add_foreign_key "everyday_behaviors", "users"
  add_foreign_key "places", "subordinates"
  add_foreign_key "places", "users"
  add_foreign_key "subordinates", "users"
end
