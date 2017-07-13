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

ActiveRecord::Schema.define(version: 20170713065104) do

  create_table "accounts", force: :cascade do |t|
    t.string "code"
    t.string "label"
    t.string "du"
    t.string "dk"
    t.string "header"
    t.string "description"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "branch_id"
  end

  create_table "addresses", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "region"
    t.string "city"
    t.string "status"
    t.string "description"
    t.integer "branch_id"
    t.integer "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "telp"
    t.string "supplier_id"
  end

  create_table "areas", force: :cascade do |t|
    t.string "name"
    t.string "description"
  end

  create_table "asset_details", force: :cascade do |t|
    t.string "category"
    t.date "date"
    t.string "note"
    t.decimal "value", precision: 15, scale: 2
    t.integer "assetm_id"
  end

  create_table "assetms", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.string "category"
    t.string "location"
    t.string "unit"
    t.decimal "value", precision: 15, scale: 2
    t.date "date"
    t.string "warranty"
    t.string "status"
    t.string "serial"
    t.string "description"
    t.string "slug"
    t.integer "branch_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "note"
    t.string "slug"
  end

  create_table "customers", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.string "group"
    t.string "cp"
    t.string "status"
    t.decimal "climit", precision: 15, scale: 2
    t.decimal "dlimit", precision: 15, scale: 2
    t.decimal "tclimit", precision: 15, scale: 2
    t.decimal "tdlimit", precision: 15, scale: 2
    t.integer "branch_id"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "telp"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "branch_id"
  end

  create_table "inventories", force: :cascade do |t|
    t.integer "product_id"
    t.integer "warehouse_id"
    t.integer "quantity"
    t.integer "branch_id"
    t.string "code"
    t.integer "stock_id"
    t.string "category"
  end

  create_table "journals", force: :cascade do |t|
    t.string "code"
    t.date "date"
    t.string "description"
    t.string "status"
    t.decimal "total", precision: 15, scale: 2
    t.string "slug"
    t.integer "branch_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ledgers", force: :cascade do |t|
    t.integer "journal_id"
    t.string "coa"
    t.decimal "debit", precision: 15, scale: 2
    t.decimal "credit", precision: 15, scale: 2
    t.string "note"
  end

  create_table "priceareas", force: :cascade do |t|
  end

  create_table "pricelists", force: :cascade do |t|
    t.string "name"
    t.integer "inventory_id"
    t.decimal "price", precision: 15, scale: 2
    t.decimal "cogs", precision: 15, scale: 2
    t.string "startfrom"
    t.integer "group_id"
  end

  create_table "product_settings", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.integer "branch_id"
    t.string "slug"
    t.string "product_type"
  end

  create_table "products", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.string "kw"
    t.string "category_id"
    t.integer "branch_id"
    t.integer "warehouse_id"
    t.string "slug"
  end

  create_table "salesmen", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.date "dbirth"
    t.string "identity"
    t.string "status"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "branch_id"
  end

  create_table "stocks", force: :cascade do |t|
    t.string "code"
    t.date "date"
    t.string "status"
    t.string "description"
    t.integer "branch_id"
    t.string "slug"
    t.string "menu"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "suppliers", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.string "cp"
    t.string "telp"
    t.decimal "climit", precision: 15, scale: 2
    t.decimal "dlimit", precision: 15, scale: 2
    t.string "status"
    t.string "group"
    t.integer "branch_id"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "targets", force: :cascade do |t|
    t.date "startfrom"
    t.date "finishdate"
    t.integer "targetbox"
    t.decimal "targetsales", precision: 15, scale: 2
    t.string "note"
    t.integer "salesman_id"
  end

  create_table "transaction_logs", force: :cascade do |t|
    t.string "code"
    t.string "form"
    t.string "action"
    t.integer "user_id"
    t.integer "branch_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "fullname"
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.integer "branch_id"
    t.string "slug"
  end

  create_table "warehouses", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.string "description"
    t.integer "branch_id"
    t.string "slug"
  end

end
