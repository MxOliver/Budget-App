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

ActiveRecord::Schema.define(version: 2019_07_07_013331) do

  create_table "expenses", force: :cascade do |t|
    t.string "name"
    t.integer "planned_amount"
    t.integer "actual_amount"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "long_term_savings"
    t.boolean "short_term_savings"
    t.integer "total"
    t.index ["long_term_savings"], name: "index_expenses_on_long_term_savings"
    t.index ["short_term_savings"], name: "index_expenses_on_short_term_savings"
    t.index ["total"], name: "index_expenses_on_total"
    t.index ["user_id"], name: "index_expenses_on_user_id"
  end

  create_table "savings", force: :cascade do |t|
    t.boolean "long_term"
    t.boolean "short_term"
    t.integer "expense_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["expense_id"], name: "index_savings_on_expense_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "total_income"
    t.index ["total_income"], name: "index_users_on_total_income"
  end

end
