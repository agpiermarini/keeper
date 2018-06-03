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

ActiveRecord::Schema.define(version: 2018_06_02_191907) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dimensions", force: :cascade do |t|
    t.text "name"
    t.decimal "percentile"
    t.bigint "personality_profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["personality_profile_id"], name: "index_dimensions_on_personality_profile_id"
  end

  create_table "facets", force: :cascade do |t|
    t.text "name"
    t.decimal "percentile"
    t.bigint "dimension_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dimension_id"], name: "index_facets_on_dimension_id"
  end

  create_table "needs", force: :cascade do |t|
    t.text "name"
    t.decimal "percentile"
    t.bigint "personality_profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["personality_profile_id"], name: "index_needs_on_personality_profile_id"
  end

  create_table "personality_profiles", force: :cascade do |t|
    t.text "username"
    t.integer "word_count"
    t.string "warning_message"
    t.string "error_message"
    t.integer "total_tweets_analyzed"
    t.string "newest_tweet_analyzed_date"
    t.string "oldest_tweet_analyzed_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "uid"
    t.string "username"
    t.string "name"
    t.string "oauth_token"
    t.string "oauth_secret"
    t.string "avatar_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug", null: false
    t.index ["slug"], name: "index_users_on_slug", unique: true
  end

  create_table "values", force: :cascade do |t|
    t.text "name"
    t.decimal "percentile"
    t.bigint "personality_profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["personality_profile_id"], name: "index_values_on_personality_profile_id"
  end

  add_foreign_key "dimensions", "personality_profiles"
  add_foreign_key "facets", "dimensions"
  add_foreign_key "needs", "personality_profiles"
  add_foreign_key "values", "personality_profiles"
end
