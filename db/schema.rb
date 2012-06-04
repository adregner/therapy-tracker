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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120602170957) do

  create_table "agencies", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "clients", :force => true do |t|
    t.integer  "company_id"
    t.integer  "contact_id"
    t.integer  "agency_id"
    t.integer  "rate_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "clients", ["agency_id"], :name => "index_clients_on_agency_id"
  add_index "clients", ["company_id"], :name => "index_clients_on_company_id"
  add_index "clients", ["contact_id"], :name => "index_clients_on_contact_id"
  add_index "clients", ["rate_id"], :name => "index_clients_on_rate_id"

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.integer  "contact_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "companies", ["contact_id"], :name => "index_companies_on_contact_id"

  create_table "contacts", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "phone"
    t.string   "fax"
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "invoices", :force => true do |t|
    t.integer  "total"
    t.integer  "company_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "invoices", ["company_id"], :name => "index_invoices_on_company_id"

  create_table "miles", :force => true do |t|
    t.datetime "date"
    t.integer  "total_miles"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "rates", :force => true do |t|
    t.decimal  "value",      :precision => 6, :scale => 2
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
  end

  create_table "visits", :force => true do |t|
    t.datetime "datetime"
    t.decimal  "duration",   :precision => 4, :scale => 2
    t.integer  "client_id"
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
    t.integer  "invoice_id"
  end

  add_index "visits", ["client_id"], :name => "index_visits_on_client_id"
  add_index "visits", ["invoice_id"], :name => "index_visits_on_invoice_id"

end
