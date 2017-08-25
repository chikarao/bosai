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

ActiveRecord::Schema.define(version: 20170726065528) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "evacuation_points", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "number_of_evacuees"
    t.integer  "max_evacuees"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "name"
    t.index ["user_id"], name: "index_evacuation_points_on_user_id", using: :btree
  end

  create_table "items", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items_requests", force: :cascade do |t|
    t.integer  "item_id"
    t.integer  "request_id"
    t.string   "quantity"
    t.string   "status",     default: "open"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["item_id"], name: "index_items_requests_on_item_id", using: :btree
    t.index ["request_id"], name: "index_items_requests_on_request_id", using: :btree
  end

  create_table "messages", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "request_id"
    t.text     "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["request_id"], name: "index_messages_on_request_id", using: :btree
    t.index ["user_id"], name: "index_messages_on_user_id", using: :btree
  end

  create_table "organizations", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "requests", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "category"
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "status",     default: "open"
    t.string   "priority"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.text     "text"
    t.index ["user_id"], name: "index_requests_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address"
    t.string   "phone_number"
    t.integer  "organization_id"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "evacuation_point_id"
    t.string   "provider"
    t.string   "uid"
    t.string   "facebook_picture_url"
    t.string   "token"
    t.datetime "token_expiry"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["evacuation_point_id"], name: "index_users_on_evacuation_point_id", using: :btree
    t.index ["organization_id"], name: "index_users_on_organization_id", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "evacuation_points", "users"
  add_foreign_key "items_requests", "requests"
  add_foreign_key "messages", "requests"
  add_foreign_key "messages", "users"
  add_foreign_key "requests", "users"
  add_foreign_key "users", "evacuation_points"
  add_foreign_key "users", "organizations"
end