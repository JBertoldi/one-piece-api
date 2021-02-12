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

ActiveRecord::Schema.define(version: 2021_01_28_011140) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "characters", force: :cascade do |t|
    t.string "jp_name", null: false
    t.string "en_name", null: false
    t.string "epithet"
    t.integer "bounty"
    t.string "status", default: "alive"
    t.bigint "devil_fruit_id"
    t.bigint "pirate_crew_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["devil_fruit_id"], name: "index_characters_on_devil_fruit_id"
    t.index ["pirate_crew_id"], name: "index_characters_on_pirate_crew_id"
  end

  create_table "devil_fruits", force: :cascade do |t|
    t.string "name", null: false
    t.string "power_type", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "pirate_crews", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "characters", "devil_fruits"
  add_foreign_key "characters", "pirate_crews"
end
