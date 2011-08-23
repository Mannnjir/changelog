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

ActiveRecord::Schema.define(:version => 20110819124434) do

  create_table "pivotal_stories", :force => true do |t|
    t.integer  "version_id"
    t.string   "title"
    t.string   "story_type"
    t.integer  "story_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "accepted_at"
  end

  add_index "pivotal_stories", ["version_id"], :name => "pivotal_stories_n1"

  create_table "versions", :force => true do |t|
    t.string   "name"
    t.integer  "major"
    t.integer  "minor"
    t.integer  "build"
    t.date     "release_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end