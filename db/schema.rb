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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130712153629) do

  create_table "quotes", :force => true do |t|
    t.string   "name"
    t.float    "cost_per_hour"
    t.integer  "hours_per_day"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.text     "description"
    t.string   "status"
    t.float    "total_cost"
    t.float    "total_hours"
  end

  create_table "quotes_users_roles", :force => true do |t|
    t.integer "quote_id"
    t.integer "user_id"
    t.integer "role_id"
  end

  create_table "roles", :force => true do |t|
    t.string "name"
  end

  create_table "use_cases", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.float    "design_time"
    t.float    "programming_time"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.boolean  "is_extra"
    t.boolean  "is_feature"
    t.integer  "quote_id"
    t.string   "userType"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "password"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
