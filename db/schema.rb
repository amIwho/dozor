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

ActiveRecord::Schema.define(:version => 20130430121257) do

  create_table "ckeditor_assets", :force => true do |t|
    t.string   "data_file_name",                  :null => false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    :limit => 30
    t.string   "type",              :limit => 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], :name => "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], :name => "idx_ckeditor_assetable_type"

  create_table "codes", :force => true do |t|
    t.string   "name"
    t.string   "dif"
    t.integer  "task_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

# Could not dump table "games" because of following StandardError
#   Unknown type 'bool' for column 'current'

  create_table "rgames", :force => true do |t|
    t.integer  "game_id"
    t.integer  "team_id"
    t.integer  "current_task_id"
    t.datetime "finished_at"
    t.datetime "current_task_entered_at"
    t.string   "answered_questions",      :default => "'--- []\n'"
    t.datetime "created_at",                                        :null => false
    t.datetime "updated_at",                                        :null => false
  end

  create_table "task_orders", :force => true do |t|
    t.integer  "game_id"
    t.integer  "team_id"
    t.integer  "task_id"
    t.integer  "order_n"
    t.boolean  "solved"
    t.boolean  "dropped"
    t.datetime "time_start"
    t.datetime "time_hint1"
    t.datetime "time_hint2"
    t.datetime "solve_time"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tasks", :force => true do |t|
    t.string   "name"
    t.text     "fulltext"
    t.string   "image_url"
    t.integer  "game_id"
    t.string   "location"
    t.text     "hint1"
    t.text     "hint2"
    t.text     "comments"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "position"
  end

  create_table "teams", :force => true do |t|
    t.string   "name"
    t.string   "cap"
    t.string   "phone"
    t.boolean  "confirm"
    t.string   "login"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.boolean  "is_admin"
  end

  create_table "tryes", :force => true do |t|
    t.integer  "team_id"
    t.string   "code"
    t.boolean  "match"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
