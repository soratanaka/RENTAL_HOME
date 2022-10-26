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

ActiveRecord::Schema.define(version: 2022_10_24_015446) do

  create_table "homes", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.string "address"
    t.integer "age"
    t.text "remarks"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "nearest_stations", force: :cascade do |t|
    t.text "route"
    t.text "station"
    t.integer "time"
    t.integer "home_id", null: false
    t.index ["home_id"], name: "index_nearest_stations_on_home_id"
  end

  add_foreign_key "nearest_stations", "homes"
end
