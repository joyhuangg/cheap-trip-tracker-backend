# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_10_31_214330) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string "title"
    t.string "link"
    t.string "snippet"
    t.integer "trip_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "flights", force: :cascade do |t|
    t.string "origin"
    t.string "destination"
    t.datetime "departure_date"
    t.datetime "return_date"
    t.string "flight_number"
    t.string "operating_airline"
    t.float "price"
    t.integer "trip_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hotels", force: :cascade do |t|
    t.string "longitude"
    t.string "latitude"
    t.string "address"
    t.float "price"
    t.string "property_name"
    t.float "rating"
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "image_url"
    t.string "name"
    t.string "url"
    t.float "rating"
    t.string "longitude"
    t.string "latitude"
    t.string "address"
    t.float "price"
    t.string "cuisines"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trip_hotels", force: :cascade do |t|
    t.integer "trip_id"
    t.integer "hotel_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trip_restaurants", force: :cascade do |t|
    t.integer "trip_id"
    t.integer "restaurant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trips", force: :cascade do |t|
    t.string "name"
    t.integer "user_id"
    t.string "location"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer "num_ppl"
    t.float "price"
    t.string "longitude"
    t.string "latitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.integer "current_trip_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
