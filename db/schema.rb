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

ActiveRecord::Schema[7.2].define(version: 2024_11_04_085143) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "plant_racks", force: :cascade do |t|
    t.float "version", null: false
    t.jsonb "raw_data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "plants", force: :cascade do |t|
    t.bigint "shelf_id", null: false
    t.string "title"
    t.string "number"
    t.integer "arrangement"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shelf_id"], name: "index_plants_on_shelf_id"
  end

  create_table "sensors_measurements", force: :cascade do |t|
    t.integer "soil_moisture_normalized"
    t.integer "soil_moisture_raw"
    t.boolean "light"
    t.bigint "plant_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plant_id"], name: "index_sensors_measurements_on_plant_id"
  end

  create_table "shelves", force: :cascade do |t|
    t.bigint "plant_rack_id", null: false
    t.integer "arrangement"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plant_rack_id"], name: "index_shelves_on_plant_rack_id"
  end

  add_foreign_key "plants", "shelves"
  add_foreign_key "sensors_measurements", "plants"
  add_foreign_key "shelves", "plant_racks"
end
