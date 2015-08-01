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

ActiveRecord::Schema.define(version: 20150726220844) do

  create_table "character_tags", force: true do |t|
    t.string   "name"
    t.string   "relationship"
    t.integer  "relationshipType_id"
    t.string   "nickname"
    t.datetime "created_at"
    t.datetime "updated_at"
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

end
