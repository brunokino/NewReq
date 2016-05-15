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

ActiveRecord::Schema.define(version: 20160515132409) do

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.string   "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "grants", force: :cascade do |t|
    t.string   "username"
    t.boolean  "manager"
    t.boolean  "admin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "cn"
  end

  create_table "ldapservers", force: :cascade do |t|
    t.string   "host"
    t.string   "port"
    t.string   "attributename"
    t.string   "base"
    t.string   "username"
    t.string   "password"
    t.string   "method"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "domain"
  end

  create_table "newuserldaps", force: :cascade do |t|
    t.string   "dn"
    t.string   "objectclass"
    t.string   "givenname"
    t.string   "sn"
    t.string   "cn"
    t.string   "name"
    t.string   "displayname"
    t.string   "userPrincipalName"
    t.string   "sAMAccountName"
    t.string   "title"
    t.string   "description"
    t.string   "company"
    t.string   "department"
    t.string   "telephoneNumber"
    t.string   "facsimileTelephoneNumber"
    t.string   "homePhone"
    t.string   "ipPhone"
    t.string   "mobile"
    t.string   "physicalDeliveryOfficeName"
    t.string   "l"
    t.string   "st"
    t.string   "streetAddress"
    t.string   "postalCode"
    t.string   "postOfficeBox"
    t.string   "c"
    t.string   "manager"
    t.string   "mail"
    t.string   "proxyAddresses"
    t.string   "wWWHomePage"
    t.string   "userPassword"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "newusers_id"
  end

  create_table "newusers", force: :cascade do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "username"
    t.string   "title"
    t.string   "description"
    t.string   "company_id"
    t.string   "site_id"
    t.string   "department"
    t.string   "grant_id"
    t.string   "phone"
    t.string   "mobile"
    t.string   "homephone"
    t.string   "ipphone"
    t.string   "pager"
    t.string   "Office"
    t.string   "City"
    t.string   "address"
    t.string   "State"
    t.string   "Country"
    t.string   "postalcode"
    t.string   "pobox"
    t.string   "website"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "sites", force: :cascade do |t|
    t.string   "company_id"
    t.string   "name"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",       default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "username"
  end

  add_index "users", ["username"], name: "index_users_on_username"

end
