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

ActiveRecord::Schema.define(version: 20160815020618) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree
  end

  create_table "favorites", force: :cascade do |t|
    t.integer  "tweet_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tweet_id", "user_id"], name: "index_favorites_on_tweet_id_and_user_id", unique: true, using: :btree
    t.index ["tweet_id"], name: "index_favorites_on_tweet_id", using: :btree
    t.index ["user_id"], name: "index_favorites_on_user_id", using: :btree
  end

  create_table "list_members", force: :cascade do |t|
    t.integer  "list_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["list_id", "user_id"], name: "index_list_members_on_list_id_and_user_id", unique: true, using: :btree
    t.index ["list_id"], name: "index_list_members_on_list_id", using: :btree
    t.index ["user_id"], name: "index_list_members_on_user_id", using: :btree
  end

  create_table "list_subscribers", force: :cascade do |t|
    t.integer  "list_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["list_id", "user_id"], name: "index_list_subscribers_on_list_id_and_user_id", unique: true, using: :btree
    t.index ["list_id"], name: "index_list_subscribers_on_list_id", using: :btree
    t.index ["user_id"], name: "index_list_subscribers_on_user_id", using: :btree
  end

  create_table "lists", force: :cascade do |t|
    t.string   "name"
    t.integer  "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_lists_on_author_id", using: :btree
    t.index ["name", "author_id"], name: "index_lists_on_name_and_author_id", unique: true, using: :btree
    t.index ["name"], name: "index_lists_on_name", using: :btree
  end

  create_table "relationships", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["followed_id"], name: "index_relationships_on_followed_id", using: :btree
    t.index ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true, using: :btree
    t.index ["follower_id"], name: "index_relationships_on_follower_id", using: :btree
  end

  create_table "retweets", force: :cascade do |t|
    t.integer  "tweet_id"
    t.integer  "retweeter_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["retweeter_id"], name: "index_retweets_on_retweeter_id", using: :btree
    t.index ["tweet_id", "retweeter_id"], name: "index_retweets_on_tweet_id_and_retweeter_id", unique: true, using: :btree
    t.index ["tweet_id"], name: "index_retweets_on_tweet_id", using: :btree
  end

  create_table "tagged_tweets", force: :cascade do |t|
    t.integer  "tweet_id"
    t.integer  "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tag_id"], name: "index_tagged_tweets_on_tag_id", using: :btree
    t.index ["tweet_id", "tag_id"], name: "index_tagged_tweets_on_tweet_id_and_tag_id", unique: true, using: :btree
    t.index ["tweet_id"], name: "index_tagged_tweets_on_tweet_id", using: :btree
  end

  create_table "tags", force: :cascade do |t|
    t.string   "tag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tag"], name: "index_tags_on_tag", unique: true, using: :btree
  end

  create_table "tweets", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "tweet"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_tweets_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  end

end
