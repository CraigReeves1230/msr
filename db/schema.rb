# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160531010306) do

  create_table "results", force: :cascade do |t|
    t.float    "execution"
    t.float    "heat"
    t.float    "action"
    t.float    "layout"
    t.float    "selling"
    t.boolean  "factoring_heat"
    t.float    "score"
    t.string   "star_rating"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "name"
  end

  create_table "wrestlers", force: :cascade do |t|
    t.float    "striking"
    t.float    "slams"
    t.float    "submission"
    t.float    "sell_timing"
    t.float    "setting_up"
    t.float    "transition"
    t.float    "mat_and_chain"
    t.float    "bumping"
    t.float    "technical"
    t.float    "power"
    t.float    "high_fly"
    t.float    "durability"
    t.float    "conditioning"
    t.float    "basing"
    t.float    "reaction_time"
    t.float    "ability"
    t.float    "shine"
    t.float    "heat"
    t.float    "comebacks"
    t.float    "selling"
    t.float    "ring_awareness"
    t.float    "psychology"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "name"
    t.float    "execution"
    t.float    "score"
    t.string   "star_rating"
  end

end
