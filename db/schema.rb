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

ActiveRecord::Schema.define(version: 20160825105935) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "buildings", force: :cascade do |t|
    t.integer  "lot_id"
    t.string   "building_name"
    t.text     "description"
    t.string   "picture"
    t.string   "address"
    t.integer  "floors"
    t.integer  "shared_space"
    t.integer  "elevator_amount"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["lot_id"], name: "index_buildings_on_lot_id", using: :btree
  end

  create_table "consulting_hours", force: :cascade do |t|
    t.integer  "customer_id"
    t.integer  "employee_id"
    t.integer  "elapsed_time"
    t.text     "description"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.date     "date"
    t.index ["customer_id"], name: "index_consulting_hours_on_customer_id", using: :btree
    t.index ["employee_id"], name: "index_consulting_hours_on_employee_id", using: :btree
  end

  create_table "customers", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "mobile_number"
    t.string   "address"
    t.date     "birthday"
    t.string   "phone_number"
    t.string   "iban"
    t.string   "welcome_box"
    t.text     "notes"
    t.integer  "used_hours"
    t.date     "signing_date"
    t.date     "deed_date"
    t.string   "picture"
    t.index ["email"], name: "index_customers_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true, using: :btree
  end

  create_table "decisions", force: :cascade do |t|
    t.integer  "unit_id"
    t.integer  "supplier_id"
    t.string   "title"
    t.text     "description"
    t.date     "date"
    t.date     "due_date"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "status"
    t.integer  "document_id"
    t.index ["supplier_id"], name: "index_decisions_on_supplier_id", using: :btree
    t.index ["unit_id"], name: "index_decisions_on_unit_id", using: :btree
  end

  create_table "documents", force: :cascade do |t|
    t.integer  "unit_id"
    t.string   "file"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "kind"
    t.index ["unit_id"], name: "index_documents_on_unit_id", using: :btree
  end

  create_table "employee_projects", force: :cascade do |t|
    t.integer  "employee_id"
    t.integer  "project_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["employee_id"], name: "index_employee_projects_on_employee_id", using: :btree
    t.index ["project_id"], name: "index_employee_projects_on_project_id", using: :btree
  end

  create_table "employees", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "facebook_picture_url"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "token"
    t.datetime "token_expiry"
    t.string   "mobile_number"
    t.string   "title"
    t.string   "picture"
    t.index ["email"], name: "index_employees_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_employees_on_reset_password_token", unique: true, using: :btree
  end

  create_table "handovers", force: :cascade do |t|
    t.integer  "unit_id"
    t.string   "title"
    t.text     "description"
    t.date     "date"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "document_id"
    t.index ["unit_id"], name: "index_handovers_on_unit_id", using: :btree
  end

  create_table "information", force: :cascade do |t|
    t.integer  "unit_id"
    t.string   "title"
    t.text     "description"
    t.boolean  "read"
    t.date     "date"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "document_id"
    t.index ["unit_id"], name: "index_information_on_unit_id", using: :btree
  end

  create_table "lots", force: :cascade do |t|
    t.integer  "phase_id"
    t.string   "lot_number"
    t.text     "description"
    t.string   "picture"
    t.string   "cadastral_reference"
    t.integer  "lot_size"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["phase_id"], name: "index_lots_on_phase_id", using: :btree
  end

  create_table "news", force: :cascade do |t|
    t.integer  "phase_id"
    t.string   "title"
    t.text     "description"
    t.string   "picture"
    t.date     "date"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["phase_id"], name: "index_news_on_phase_id", using: :btree
  end

  create_table "parking_units", force: :cascade do |t|
    t.integer  "lot_id"
    t.string   "parking_name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "unit_id"
    t.index ["lot_id"], name: "index_parking_units_on_lot_id", using: :btree
  end

  create_table "payments", force: :cascade do |t|
    t.integer  "unit_id"
    t.string   "name"
    t.text     "description"
    t.integer  "amount"
    t.string   "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.date     "due_date"
    t.integer  "document_id"
    t.index ["unit_id"], name: "index_payments_on_unit_id", using: :btree
  end

  create_table "phases", force: :cascade do |t|
    t.integer  "project_id"
    t.integer  "phase_number"
    t.text     "description"
    t.integer  "duration"
    t.string   "picture"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["project_id"], name: "index_phases_on_project_id", using: :btree
  end

  create_table "projects", force: :cascade do |t|
    t.string   "commercial_name"
    t.string   "internal_name"
    t.text     "description"
    t.integer  "plotsize"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.float    "longitude"
    t.float    "latitude"
  end

  create_table "site_visits", force: :cascade do |t|
    t.integer  "unit_id"
    t.string   "title"
    t.text     "description"
    t.date     "date"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "document_id"
    t.index ["unit_id"], name: "index_site_visits_on_unit_id", using: :btree
  end

  create_table "storage_units", force: :cascade do |t|
    t.integer  "building_id"
    t.string   "storage_name"
    t.integer  "storage_size"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "unit_id"
    t.index ["building_id"], name: "index_storage_units_on_building_id", using: :btree
  end

  create_table "supplier_projects", force: :cascade do |t|
    t.integer  "supplier_id"
    t.integer  "project_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["project_id"], name: "index_supplier_projects_on_project_id", using: :btree
    t.index ["supplier_id"], name: "index_supplier_projects_on_supplier_id", using: :btree
  end

  create_table "suppliers", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "mobile_number"
    t.string   "phone_number"
    t.string   "email"
    t.string   "company_name"
    t.string   "logo"
    t.string   "address"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "units", force: :cascade do |t|
    t.integer  "building_id"
    t.integer  "customer_id"
    t.string   "unit_name"
    t.text     "description"
    t.string   "picture"
    t.string   "address"
    t.integer  "floor_number"
    t.string   "orientation"
    t.integer  "floor_size"
    t.boolean  "sold"
    t.integer  "price_initial_budget"
    t.integer  "price_contracted"
    t.integer  "land_value"
    t.integer  "construction_value"
    t.integer  "registration_tax_land"
    t.integer  "vat_construction"
    t.string   "sales_person"
    t.integer  "consulting_hours"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["building_id"], name: "index_units_on_building_id", using: :btree
    t.index ["customer_id"], name: "index_units_on_customer_id", using: :btree
  end

  add_foreign_key "buildings", "lots"
  add_foreign_key "consulting_hours", "customers"
  add_foreign_key "consulting_hours", "employees"
  add_foreign_key "decisions", "suppliers"
  add_foreign_key "decisions", "units"
  add_foreign_key "documents", "units"
  add_foreign_key "employee_projects", "employees"
  add_foreign_key "employee_projects", "projects"
  add_foreign_key "handovers", "units"
  add_foreign_key "information", "units"
  add_foreign_key "lots", "phases"
  add_foreign_key "news", "phases"
  add_foreign_key "parking_units", "lots"
  add_foreign_key "payments", "units"
  add_foreign_key "phases", "projects"
  add_foreign_key "site_visits", "units"
  add_foreign_key "storage_units", "buildings"
  add_foreign_key "supplier_projects", "projects"
  add_foreign_key "supplier_projects", "suppliers"
  add_foreign_key "units", "buildings"
  add_foreign_key "units", "customers"
end
