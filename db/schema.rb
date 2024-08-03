# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2024_07_21_043234) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blogs", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "comments", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.uuid "entry_id"
    t.uuid "creator_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["creator_id"], name: "index_comments_on_creator_id"
    t.index ["entry_id"], name: "index_comments_on_entry_id"
  end

  create_table "entries", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "slug"
    t.string "title"
    t.jsonb "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.uuid "creator_id"
    t.uuid "blog_id"
    t.index ["blog_id"], name: "index_entries_on_blog_id"
    t.index ["creator_id"], name: "index_entries_on_creator_id"
  end

  create_table "entries_tags", id: false, force: :cascade do |t|
    t.bigint "tags_id"
    t.bigint "entries_id"
    t.index ["entries_id"], name: "index_entries_tags_on_entries_id"
    t.index ["tags_id"], name: "index_entries_tags_on_tags_id"
  end

  create_table "tags", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.uuid "blog_id"
    t.index ["blog_id"], name: "index_tags_on_blog_id"
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "comments", "entries"
  add_foreign_key "comments", "users", column: "creator_id"
  add_foreign_key "entries", "blogs"
  add_foreign_key "entries", "users", column: "creator_id"
  add_foreign_key "tags", "blogs"
end
