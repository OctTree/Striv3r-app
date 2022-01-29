# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_01_23_113042) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
  end

  create_table "activity_logs", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name"
    t.date "date_at"
    t.string "minutes"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_activity_logs_on_user_id"
  end

  create_table "activity_plans", force: :cascade do |t|
    t.bigint "user_id"
    t.string "activity_name"
    t.integer "week"
    t.integer "time"
    t.integer "frequency"
    t.date "activity_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "status", default: 0
    t.integer "frequency_days", default: 0
    t.integer "frequency_minutes", default: 0
    t.integer "time_spent", default: 0
    t.integer "remaining_time", default: 0
    t.integer "frequency_finished", default: 0
    t.boolean "completed", default: false
    t.index ["user_id"], name: "index_activity_plans_on_user_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "blacklisted_tokens", force: :cascade do |t|
    t.bigint "user_id"
    t.string "token"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_blacklisted_tokens_on_user_id"
  end

  create_table "plans", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "days_per_week"
    t.integer "minutes"
    t.text "goals"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "day_on_week"
    t.text "time_of_day"
    t.integer "frequency_days", default: 0
    t.integer "frequency_minutes", default: 0
    t.text "activity_type", default: [], array: true
    t.index ["user_id"], name: "index_plans_on_user_id"
  end

  create_table "point_redeems", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "redeemed_point", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_point_redeems_on_user_id"
  end

  create_table "refresh_tokens", force: :cascade do |t|
    t.bigint "user_id"
    t.string "refresh_token"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_refresh_tokens_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "stripe_details", force: :cascade do |t|
    t.string "stripe_price_id"
    t.float "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "stripe_products", force: :cascade do |t|
    t.string "stripe_product_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "subscriptions", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "subscription_type"
    t.float "amount"
    t.string "last_four_digits"
    t.string "stripe_card_id"
    t.string "token"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_subscriptions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "phone"
    t.string "zip"
    t.string "referral"
    t.bigint "role_id"
    t.string "referral_code"
    t.integer "point_balance"
    t.integer "total_point_earned"
    t.boolean "active", default: true
    t.string "stripe_customer_id"
    t.string "stripe_subscription_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
  end

end
