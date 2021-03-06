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

ActiveRecord::Schema.define(version: 20150809040756) do

  create_table "character_tags", force: true do |t|
    t.string   "name"
    t.string   "relationship"
    t.integer  "relationshipType_id"
    t.string   "nickname"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_url"
  end

  add_index "character_tags", ["relationshipType_id"], name: "index_character_tags_on_relationshipType_id"

  create_table "chunks", force: true do |t|
    t.integer  "style_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "chunks", ["style_id"], name: "index_chunks_on_style_id"

  create_table "content_blocks", force: true do |t|
    t.integer  "contentType_id"
    t.integer  "style_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "content_blocks", ["contentType_id"], name: "index_content_blocks_on_contentType_id"
  add_index "content_blocks", ["style_id"], name: "index_content_blocks_on_style_id"

  create_table "content_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "detail_levels", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "eras", force: true do |t|
    t.string   "name"
    t.date     "startDate"
    t.date     "endDate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "group_has_characters", force: true do |t|
    t.integer  "group_id"
    t.integer  "characterTag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "group_has_storylines", force: true do |t|
    t.integer  "group_id"
    t.integer  "storylineTag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups", force: true do |t|
    t.integer  "chunk_id"
    t.integer  "parentGroup_id"
    t.integer  "storylineTag_id"
    t.integer  "characterTag_id"
    t.integer  "age"
    t.integer  "era_id"
    t.date     "contentDate"
    t.integer  "detailLevel_id"
    t.integer  "order"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "groups", ["characterTag_id"], name: "index_groups_on_characterTag_id"
  add_index "groups", ["chunk_id"], name: "index_groups_on_chunk_id"
  add_index "groups", ["detailLevel_id"], name: "index_groups_on_detailLevel_id"
  add_index "groups", ["era_id"], name: "index_groups_on_era_id"
  add_index "groups", ["parentGroup_id"], name: "index_groups_on_parentGroup_id"
  add_index "groups", ["storylineTag_id"], name: "index_groups_on_storylineTag_id"

  create_table "images", force: true do |t|
    t.string   "src"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "relationship_types", force: true do |t|
    t.string   "category"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "storyline_tags", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "styles", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "texts", force: true do |t|
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "titles", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_has_viewing_preferences", force: true do |t|
    t.integer  "user_id"
    t.integer  "viewingPreference_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_has_viewing_preferences", ["user_id"], name: "index_user_has_viewing_preferences_on_user_id"
  add_index "user_has_viewing_preferences", ["viewingPreference_id"], name: "index_user_has_viewing_preferences_on_viewingPreference_id"

  create_table "user_has_viewing_privileges", force: true do |t|
    t.integer  "user_id"
    t.integer  "viewingPrivilege_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_has_viewing_privileges", ["user_id"], name: "index_user_has_viewing_privileges_on_user_id"
  add_index "user_has_viewing_privileges", ["viewingPrivilege_id"], name: "index_user_has_viewing_privileges_on_viewingPrivilege_id"

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "encrypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "firstName"
    t.string   "lastName"
    t.integer  "role_id"
    t.integer  "last_group_viewed"
  end

  add_index "users", ["role_id"], name: "index_users_on_role_id"

  create_table "viewing_preferences", force: true do |t|
    t.integer  "textDetailLevel"
    t.integer  "imageDetailLevel"
    t.integer  "characterTag_id"
    t.integer  "storylineTag_id"
    t.date     "startDate"
    t.date     "endDate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "viewing_privileges", force: true do |t|
    t.string   "name"
    t.integer  "characterTag_id"
    t.integer  "storylineTag_id"
    t.date     "startDate"
    t.date     "endDate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
