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

ActiveRecord::Schema[7.1].define(version: 2024_11_07_132259) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "avatars", force: :cascade do |t|
    t.string "filename"
    t.boolean "taken", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "party_id"
    t.index ["party_id"], name: "index_avatars_on_party_id"
  end

  create_table "buzzs", force: :cascade do |t|
    t.datetime "time", default: -> { "CURRENT_TIMESTAMP" }
    t.boolean "clicked", default: false
    t.bigint "group_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "clickable", default: true
    t.index ["group_id"], name: "index_buzzs_on_group_id"
  end

  create_table "groups", force: :cascade do |t|
    t.integer "score"
    t.string "name"
    t.bigint "party_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "avatar_id", null: false
    t.index ["avatar_id"], name: "index_groups_on_avatar_id"
    t.index ["party_id"], name: "index_groups_on_party_id"
  end

  create_table "parties", force: :cascade do |t|
    t.string "name"
    t.string "passphrase"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "avatars", "parties"
  add_foreign_key "buzzs", "groups"
  add_foreign_key "groups", "avatars"
  add_foreign_key "groups", "parties"
end
