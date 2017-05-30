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

ActiveRecord::Schema.define(version: 20170530015837) do

  create_table "accounts", force: :cascade do |t|
    t.string "code"
    t.string "label"
    t.string "du"
    t.string "dk"
    t.string "header"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "branch_id"
  end

  create_table "branches", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.string "region"
    t.string "city"
    t.string "address"
    t.string "telp"
    t.string "cp"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "headers", force: :cascade do |t|
    t.string "title"
    t.string "header"
    t.text "content"
    t.string "footer"
    t.string "note"
  end

  create_table "salesmen", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.date "dbirth"
    t.string "identity"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "branch_id"
  end

end
