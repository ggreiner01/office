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

ActiveRecord::Schema.define(version: 20180928003337) do

  create_table "costs", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer "supplierid"
    t.integer "suppliesid"
    t.float "cost", limit: 24
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inventories", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer "supply_id"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["supply_id"], name: "supply_id"
  end

  create_table "order_statuses", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer "orderstatusid"
    t.integer "orderid"
    t.integer "complete"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer "suppliesid"
    t.integer "empid"
    t.integer "suppliersid"
    t.integer "quantity"
    t.float "totalcost", limit: 24
    t.date "date"
    t.integer "status", limit: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["suppliesid"], name: "suppliesid"
  end

  create_table "suppliers", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string "name"
    t.string "address"
    t.string "state"
    t.string "city"
    t.string "phonenum"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "supplies", primary_key: "suppliesid", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string "supplyname"
    t.string "description", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string "first_name", limit: 50
    t.string "last_name", limit: 50
    t.string "address", limit: 50
    t.string "city", limit: 50
    t.string "state", limit: 20
    t.string "phonenumber"
    t.string "email", limit: 50, default: "", null: false
    t.string "encrypted_password", limit: 50, default: "", null: false
    t.string "reset_password_token", limit: 50
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users2", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users2_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users2_on_reset_password_token", unique: true
  end

  add_foreign_key "inventories", "supplies", primary_key: "suppliesid", name: "inventories_ibfk_1"
  add_foreign_key "orders", "supplies", column: "suppliesid", primary_key: "suppliesid", name: "orders_ibfk_1"
  add_foreign_key "orders", "supplies", column: "suppliesid", primary_key: "suppliesid", name: "orders_ibfk_2"
end
