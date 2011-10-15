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

ActiveRecord::Schema.define(:version => 20111015213021) do

  create_table "answers", :force => true do |t|
    t.integer  "question_id",   :null => false
    t.integer  "created_by_id", :null => false
    t.string   "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bodies", :force => true do |t|
    t.string   "name",          :null => false
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by_id", :null => false
    t.string   "slug",          :null => false
  end

  add_index "bodies", ["name"], :name => "index_bodies_on_name", :unique => true
  add_index "bodies", ["slug"], :name => "index_bodies_on_slug", :unique => true

  create_table "membership_requests", :force => true do |t|
    t.integer  "member_id",  :null => false
    t.integer  "body_id",    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "membership_requests", ["member_id", "body_id"], :name => "index_membership_requests_on_member_id_and_body_id", :unique => true

  create_table "memberships", :force => true do |t|
    t.integer  "member_id",     :null => false
    t.integer  "body_id",       :null => false
    t.integer  "created_by_id", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "memberships", ["member_id", "body_id"], :name => "index_memberships_on_member_id_and_body_id", :unique => true

  create_table "questions", :force => true do |t|
    t.integer  "body_id",       :null => false
    t.integer  "created_by_id", :null => false
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username",                                              :null => false
    t.string   "slug",                                                  :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["slug"], :name => "index_users_on_slug", :unique => true
  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

  add_foreign_key "answers", "questions", :name => "answers_question_id_fk"
  add_foreign_key "answers", "users", :name => "answers_created_by_id_fk", :column => "created_by_id"

  add_foreign_key "bodies", "users", :name => "bodies_created_by_id_fk", :column => "created_by_id"

  add_foreign_key "membership_requests", "bodies", :name => "membership_requests_body_id_fk"
  add_foreign_key "membership_requests", "users", :name => "membership_requests_member_id_fk", :column => "member_id"

  add_foreign_key "memberships", "bodies", :name => "memberships_body_id_fk"
  add_foreign_key "memberships", "users", :name => "memberships_created_by_id_fk", :column => "created_by_id"
  add_foreign_key "memberships", "users", :name => "memberships_member_id_fk", :column => "member_id"

  add_foreign_key "questions", "bodies", :name => "questions_body_id_fk"
  add_foreign_key "questions", "users", :name => "questions_created_by_id_fk", :column => "created_by_id"

end
