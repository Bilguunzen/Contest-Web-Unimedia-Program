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

ActiveRecord::Schema.define(version: 20180125034804) do

  create_table "contests", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.datetime "start"
    t.datetime "deadline"
    t.text     "detail",             limit: 65535
    t.text     "prize",              limit: 65535
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "admin"
    t.float    "point",              limit: 24
    t.integer  "time"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "code",               limit: 45
  end

  create_table "cuis", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "contest_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "point"
  end

  create_table "ios", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "input",      limit: 65535
    t.text     "output",     limit: 65535
    t.integer  "contest_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "submissions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "code",       limit: 65535
    t.string   "language"
    t.float    "point",      limit: 24
    t.integer  "cui_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "status"
    t.float    "time",       limit: 24
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "handle"
    t.string   "email"
    t.string   "password"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "admin",      limit: 1,              comment: "1 Gesen utgatai baival Admin\nTeg buyu busad nohtsold admin hereglegch bish"
    t.integer  "raiting"
  end

end
