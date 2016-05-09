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

ActiveRecord::Schema.define(version: 20160507164129) do

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "post_id"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["post_id"], name: "index_comments_on_post_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "fb_people", force: :cascade do |t|
    t.string   "name"
    t.string   "lastname"
    t.datetime "birthdate"
    t.string   "country"
    t.string   "occupation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "fb_people", ["user_id"], name: "index_fb_people_on_user_id"

  create_table "friends", force: :cascade do |t|
    t.integer  "friend_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "friends", ["user_id"], name: "index_friends_on_user_id"

  create_table "notifications", force: :cascade do |t|
    t.integer  "user_send_id"
    t.integer  "user_receive_id"
    t.text     "msg"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "post_users", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "post_users", ["post_id"], name: "index_post_users_on_post_id"
  add_index "post_users", ["user_id"], name: "index_post_users_on_user_id"

  create_table "posts", force: :cascade do |t|
    t.text     "text"
    t.string   "place"
    t.integer  "likes"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "post_photo_file_name"
    t.string   "post_photo_content_type"
    t.integer  "post_photo_file_size"
    t.datetime "post_photo_updated_at"
    t.datetime "date"
    t.string   "photo_post_file_name"
    t.string   "photo_post_content_type"
    t.integer  "photo_post_file_size"
    t.datetime "photo_post_updated_at"
    t.integer  "user_id"
  end

  add_index "posts", ["user_id"], name: "index_posts_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.string   "lastname"
    t.string   "permision_level"
    t.string   "country"
    t.string   "occupation"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.date     "birthdate"
    t.boolean  "is_female",              default: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.integer  "friend_id"
    t.integer  "user_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["friend_id"], name: "index_users_on_friend_id"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["user_id"], name: "index_users_on_user_id"

end
