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

ActiveRecord::Schema.define(version: 20160524004542) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "buckets", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string   "comment_id"
    t.integer  "shot_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "comment_created_at"
    t.string   "body"
    t.string   "user_avatar_url"
    t.string   "user_id"
    t.string   "user_name"
  end

  add_index "comments", ["shot_id"], name: "index_comments_on_shot_id", using: :btree

  create_table "shots", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.string   "width"
    t.string   "height"
    t.string   "tags"
    t.string   "image_url"
    t.string   "image_path"
    t.integer  "user_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "viewcount"
    t.integer  "likes_count"
    t.integer  "comments_count"
    t.integer  "attachments_count"
    t.integer  "rebounds_count"
    t.integer  "buckets_count"
    t.integer  "dribbble_id"
    t.string   "html_url"
    t.string   "attachments_url"
    t.string   "buckets_url"
    t.string   "comments_url"
    t.string   "likes_url"
    t.string   "projects_url"
    t.boolean  "animated"
    t.string   "user_name"
    t.string   "user_username"
    t.string   "user_html_url"
    t.string   "user_avatar_url"
    t.string   "user_bio"
    t.string   "user_location"
    t.integer  "comments_received_count"
    t.integer  "followers_count"
    t.integer  "followings_count"
    t.integer  "likes_received_count"
    t.integer  "projects_count"
    t.integer  "rebounds_received_count"
    t.integer  "shots_count"
    t.integer  "teams_count"
    t.boolean  "can_upload_shot"
    t.string   "dribbble_type"
    t.boolean  "pro"
    t.string   "followers_url"
    t.string   "following_url"
    t.string   "shots_url"
    t.string   "teams_url"
    t.string   "team"
    t.string   "images_hidpi"
    t.string   "images_normal"
    t.string   "images_teaser"
  end

  add_index "shots", ["user_id"], name: "index_shots_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "designer_id"
    t.string   "designer_full_name"
    t.string   "designer_username"
    t.string   "designer_home_url"
    t.string   "designer_avatar_url"
    t.string   "designer_bio"
    t.string   "designer_location"
    t.string   "designer_bk_count"
    t.string   "designer_comments_received_count"
    t.string   "designer_follower_count"
    t.string   "designer_is_following_count"
    t.string   "designer_made_likes_count"
    t.string   "designer_received_likes_count"
    t.string   "designer_project_count"
    t.string   "designer_rebounds_received_count"
    t.string   "designer_added_shots_count"
    t.string   "designer_list_of_followers_url"
    t.string   "designer_following_list_url"
    t.string   "designer_list_of_shots_url"
  end

end
