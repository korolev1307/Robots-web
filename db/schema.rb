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

ActiveRecord::Schema.define(version: 20190323105953) do

  create_table "good_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "goods", force: :cascade do |t|
    t.string "name"
    t.integer "quantity"
    t.integer "price"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo_file_name"
    t.string "photo_content_type"
    t.integer "photo_file_size"
    t.datetime "photo_updated_at"
    t.text "short_description"
    t.integer "good_categories_id"
    t.string "articul"
    t.decimal "weight", default: "0.0"
    t.decimal "length", default: "0.0"
    t.decimal "width", default: "0.0"
    t.decimal "height", default: "0.0"
    t.index ["good_categories_id"], name: "index_goods_on_good_categories_id"
  end

  create_table "order_goods", force: :cascade do |t|
    t.integer "order_id"
    t.integer "good_id"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["good_id"], name: "index_order_goods_on_good_id"
    t.index ["order_id"], name: "index_order_goods_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "user_id"
    t.integer "total_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.text "comment", default: ""
    t.string "telephone"
    t.string "email"
    t.integer "delivery_type"
    t.string "FIO"
    t.string "address"
    t.integer "payment_type"
    t.integer "senderCityId"
    t.integer "receiverCityId"
    t.integer "tariffId"
    t.integer "modeId"
    t.string "delivery_date"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.boolean "admin", default: false
    t.string "name", default: "", null: false
    t.string "patronymic", default: "", null: false
    t.string "surname", default: "", null: false
    t.string "organisation", default: ""
    t.string "telephone", default: "", null: false
    t.boolean "guest"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
