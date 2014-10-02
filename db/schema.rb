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

ActiveRecord::Schema.define(version: 20141001175233) do

  create_table "order_links", force: true do |t|
    t.integer  "order_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "order_links", ["order_id"], name: "index_order_links_on_order_id"
  add_index "order_links", ["user_id", "order_id"], name: "index_order_links_on_user_id_and_order_id"
  add_index "order_links", ["user_id"], name: "index_order_links_on_user_id"

  create_table "orders", force: true do |t|
    t.string   "grade"
    t.string   "notes"
    t.integer  "order_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "orders", ["order_id"], name: "index_orders_on_order_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["user_id"], name: "index_users_on_user_id"

end
