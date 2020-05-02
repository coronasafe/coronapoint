# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_05_02_070155) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "applications", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "port_id"
    t.string "flight_number"
    t.datetime "arrival_on"
    t.string "port_of_departure"
    t.string "alternate_contact"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "full_name"
    t.string "address"
    t.string "phone"
    t.string "aadhar"
    t.boolean "quaratine_is_over"
    t.date "when_quarantine_over"
    t.date "date_of_medical_exam"
    t.string "disease_remarks"
    t.string "route"
    t.string "purpose_of_trip"
    t.string "type_of_vehicle"
    t.integer "number_of_vehicles"
    t.string "private_vehicle_details"
    t.integer "total_persons"
    t.index ["port_id"], name: "index_applications_on_port_id"
    t.index ["user_id"], name: "index_applications_on_user_id"
  end

  create_table "calls", force: :cascade do |t|
    t.bigint "contact_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["contact_id"], name: "index_calls_on_contact_id"
    t.index ["user_id"], name: "index_calls_on_user_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "gender"
    t.integer "age"
    t.string "house_name"
    t.integer "ward"
    t.string "landmark"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "panchayat_id"
    t.boolean "willing_to_pay"
    t.string "ration_type"
    t.string "feedback"
    t.integer "number_of_family_members"
    t.date "date_of_contact"
    t.string "tracking_type"
    t.text "panchayat_feedback"
    t.string "passport_number"
    t.string "alternate_contact"
    t.bigint "application_id"
    t.bigint "user_id"
    t.boolean "has_diabetes"
    t.boolean "has_hyper_tension"
    t.boolean "has_heart_disease"
    t.boolean "has_kidney_disease"
    t.boolean "is_pregnant"
    t.string "recent_history"
    t.string "symptoms"
    t.boolean "primary_contact"
    t.boolean "has_tested"
    t.boolean "was_positive"
    t.string "test_type"
    t.boolean "aarogya_setu_downloaded"
    t.boolean "doctor_certificate"
    t.string "doctor_name"
    t.index ["application_id"], name: "index_contacts_on_application_id"
    t.index ["panchayat_id"], name: "index_contacts_on_panchayat_id"
    t.index ["phone"], name: "index_contacts_on_phone", unique: true
    t.index ["user_id"], name: "index_contacts_on_user_id"
  end

  create_table "districts", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "health_reports", force: :cascade do |t|
    t.boolean "has_diabetes"
    t.boolean "has_hyper_tension"
    t.boolean "has_heart_disease"
    t.boolean "has_kidney_disease"
    t.boolean "is_pregnant"
    t.string "recent_history"
    t.string "symptoms"
    t.boolean "primary_contact"
    t.boolean "has_tested"
    t.boolean "was_positive"
    t.string "test_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "contact_id"
    t.index ["contact_id"], name: "index_health_reports_on_contact_id"
  end

  create_table "houses", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "ward"
    t.bigint "panchayat_id"
    t.string "contact_number"
    t.string "contact_person"
    t.string "comment"
    t.string "status"
    t.bigint "application_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["application_id"], name: "index_houses_on_application_id"
    t.index ["panchayat_id"], name: "index_houses_on_panchayat_id"
  end

  create_table "panchayats", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "district_id"
    t.index ["district_id"], name: "index_panchayats_on_district_id"
  end

  create_table "ports", force: :cascade do |t|
    t.string "name"
    t.string "port_type"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "role"
    t.bigint "panchayat_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["panchayat_id"], name: "index_users_on_panchayat_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vehicles", force: :cascade do |t|
    t.bigint "application_id", null: false
    t.string "number_plate"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "seats"
    t.index ["application_id"], name: "index_vehicles_on_application_id"
  end

  add_foreign_key "calls", "contacts"
  add_foreign_key "calls", "users"
  add_foreign_key "vehicles", "applications"
end
