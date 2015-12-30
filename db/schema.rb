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

ActiveRecord::Schema.define(version: 20151230120812) do

  create_table "checks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "participation_id",               null: false
    t.text     "note",             limit: 65535
    t.integer  "priority"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.index ["participation_id"], name: "index_checks_on_participation_id", using: :btree
  end

  create_table "circle_taggings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "circle_id",  null: false
    t.integer  "tag_id",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["circle_id"], name: "index_circle_taggings_on_circle_id", using: :btree
    t.index ["tag_id"], name: "index_circle_taggings_on_tag_id", using: :btree
  end

  create_table "circles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",             null: false
    t.string   "representer_name"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "consignments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "circle_id",        null: false
    t.integer  "participation_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["circle_id"], name: "index_consignments_on_circle_id", using: :btree
    t.index ["participation_id"], name: "index_consignments_on_participation_id", using: :btree
  end

  create_table "errands", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "participation_id",               null: false
    t.text     "note",             limit: 65535
    t.integer  "priority"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.index ["participation_id"], name: "index_errands_on_participation_id", using: :btree
  end

  create_table "events", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "slug",                      null: false
    t.datetime "starts_at",                 null: false
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "item_informations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "participation_id",                               null: false
    t.integer  "consignment_id"
    t.string   "name",                                           null: false
    t.text     "description",      limit: 65535
    t.string   "url"
    t.integer  "cost"
    t.boolean  "want",                           default: false, null: false
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.index ["consignment_id"], name: "index_item_informations_on_consignment_id", using: :btree
    t.index ["participation_id"], name: "index_item_informations_on_participation_id", using: :btree
  end

  create_table "participation_taggings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "participation_id", null: false
    t.integer  "tag_id",           null: false
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["participation_id"], name: "index_participation_taggings_on_participation_id", using: :btree
    t.index ["tag_id"], name: "index_participation_taggings_on_tag_id", using: :btree
  end

  create_table "participations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "placement_day",    null: false
    t.string   "placement_block",  null: false
    t.integer  "placement_number", null: false
    t.string   "placement_ab",     null: false
    t.integer  "circle_id",        null: false
    t.integer  "event_id",         null: false
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["circle_id"], name: "index_participations_on_circle_id", using: :btree
    t.index ["event_id"], name: "index_participations_on_event_id", using: :btree
  end

  create_table "tags", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "twitter_informations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "participation_id", null: false
    t.integer  "event_id",         null: false
    t.string   "screen_name",      null: false
    t.string   "name",             null: false
    t.string   "placement_day"
    t.string   "placement_block"
    t.integer  "placement_number"
    t.string   "placement_ab"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["event_id", "screen_name"], name: "index_twitter_informations_on_event_id_and_screen_name", unique: true, using: :btree
    t.index ["event_id"], name: "index_twitter_informations_on_event_id", using: :btree
    t.index ["participation_id"], name: "index_twitter_informations_on_participation_id", using: :btree
    t.index ["screen_name"], name: "index_twitter_informations_on_screen_name", unique: true, using: :btree
  end

  create_table "webcatalog_informations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "participation_id",                null: false
    t.integer  "event_id",                        null: false
    t.string   "webcatalog_id_str",               null: false
    t.string   "name",                            null: false
    t.string   "placement_day"
    t.string   "placement_block"
    t.integer  "placement_number"
    t.string   "placement_ab"
    t.text     "comment",           limit: 65535
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "circlecut_url"
    t.index ["event_id", "webcatalog_id_str"], name: "index_webcatalog_informations_on_event_id_and_webcatalog_id_str", unique: true, using: :btree
    t.index ["event_id"], name: "index_webcatalog_informations_on_event_id", using: :btree
    t.index ["participation_id"], name: "index_webcatalog_informations_on_participation_id", using: :btree
  end

  add_foreign_key "checks", "participations"
  add_foreign_key "circle_taggings", "circles"
  add_foreign_key "circle_taggings", "tags"
  add_foreign_key "consignments", "circles"
  add_foreign_key "consignments", "participations"
  add_foreign_key "errands", "participations"
  add_foreign_key "item_informations", "consignments"
  add_foreign_key "item_informations", "participations"
  add_foreign_key "participation_taggings", "participations"
  add_foreign_key "participation_taggings", "tags"
  add_foreign_key "participations", "circles"
  add_foreign_key "participations", "events"
  add_foreign_key "twitter_informations", "events"
  add_foreign_key "twitter_informations", "participations"
  add_foreign_key "webcatalog_informations", "events"
  add_foreign_key "webcatalog_informations", "participations"
end
