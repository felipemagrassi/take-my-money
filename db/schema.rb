# frozen_string_literal: true

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

ActiveRecord::Schema[7.1].define(version: 20_240_804_020_322) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'events', force: :cascade do |t|
    t.string 'name'
    t.text 'description'
    t.string 'image_url'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'performances', force: :cascade do |t|
    t.bigint 'event_id'
    t.datetime 'start_time'
    t.datetime 'end_time'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['event_id'], name: 'index_performances_on_event_id'
  end

  create_table 'tickets', force: :cascade do |t|
    t.bigint 'user_id'
    t.bigint 'performance_id'
    t.integer 'status'
    t.integer 'access'
    t.integer 'price_cents', default: 0, null: false
    t.string 'price_currency', default: 'USD', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['performance_id'], name: 'index_tickets_on_performance_id'
    t.index ['user_id'], name: 'index_tickets_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'name', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.integer 'sign_in_count', default: 0, null: false
    t.datetime 'current_sign_in_at'
    t.datetime 'last_sign_in_at'
    t.inet 'current_sign_in_ip'
    t.inet 'last_sign_in_ip'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'performances', 'events'
  add_foreign_key 'tickets', 'performances'
  add_foreign_key 'tickets', 'users'
end
