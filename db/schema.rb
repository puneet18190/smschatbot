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

ActiveRecord::Schema.define(version: 20180405055055) do

  create_table "clients", force: :cascade do |t|
    t.string "clientid"
    t.string "mobile"
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "avg_revenue"
    t.integer "sms_status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "results", force: :cascade do |t|
    t.string "resultid"
    t.text "help"
    t.string "revenue_last_month"
    t.string "mobile_number"
    t.string "income_goal"
    t.string "date"
    t.integer "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
