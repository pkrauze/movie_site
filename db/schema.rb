# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20170810092543) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "carts", force: :cascade do |t|
    t.string   "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cartships", force: :cascade do |t|
    t.integer  "cart_id"
    t.integer  "movie_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "directors", force: :cascade do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.integer  "year_of_birth"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "movies", force: :cascade do |t|
    t.string   "title"
    t.text     "desc"
    t.integer  "year"
    t.integer  "time"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "director_id"
    t.decimal  "price",       precision: 8, scale: 2
    t.json     "cover"
  end

  create_table "order_items", force: :cascade do |t|
    t.integer  "movie_id"
    t.integer  "order_id"
    t.decimal  "total_price", precision: 8, scale: 2
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.decimal  "unit_price",  precision: 8, scale: 2
  end

  add_index "order_items", ["movie_id"], name: "index_order_items_on_movie_id", using: :btree
  add_index "order_items", ["order_id"], name: "index_order_items_on_order_id", using: :btree

  create_table "order_statuses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.decimal  "total",           precision: 8, scale: 2
    t.integer  "order_status_id"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  add_index "orders", ["order_status_id"], name: "index_orders_on_order_status_id", using: :btree

  add_foreign_key "order_items", "movies"
  add_foreign_key "order_items", "orders"
  add_foreign_key "orders", "order_statuses"
end
