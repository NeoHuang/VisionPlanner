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

ActiveRecord::Schema.define(version: 20131122111428) do

  create_table "k_measurements", force: true do |t|
    t.integer  "timestamp"
    t.float    "k1"
    t.float    "k2"
    t.float    "axis"
    t.float    "white_to_white"
    t.float    "pupil_x"
    t.float    "pupil_y"
    t.float    "pupil_rx"
    t.float    "pupil_ry"
    t.float    "pupil_q"
    t.float    "limbus_x"
    t.float    "limbus_y"
    t.float    "limbus_rx"
    t.float    "limbus_ry"
    t.float    "limbus_q"
    t.float    "cr_x"
    t.float    "cr_y"
    t.float    "cr_q"
    t.integer  "patient_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
    t.float    "ppm"
    t.float    "refractive_index"
  end

  create_table "patients", force: true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.date     "birth"
    t.integer  "gender"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
