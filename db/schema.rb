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

ActiveRecord::Schema.define(version: 20161017144759) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admissions", force: :cascade do |t|
    t.string   "subject"
    t.text     "summary"
    t.text     "genuine_idea__research"
    t.text     "genuine_idea__proof"
    t.text     "genuine_idea__processes"
    t.text     "innovativeness__target_user_expectations"
    t.text     "innovavativeness__genuine"
    t.text     "innovativeness__similarity_to_other_projects"
    t.text     "innovativeness__benefits_to_users"
    t.text     "innovativeness__research"
    t.text     "idea__short_history"
    t.text     "idea__tecniques_methods"
    t.text     "idea__verification"
    t.text     "idea__cost_cutting_techniques"
    t.text     "idea__new_tech_cost_cutting_advantages"
    t.text     "industry__market_potential"
    t.text     "industry__physibility"
    t.text     "industry__sales_potential"
    t.text     "industry__added_value"
    t.boolean  "final"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.integer  "user_id"
    t.text     "bio"
    t.index ["user_id"], name: "index_admissions_on_user_id", using: :btree
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "genuine_idea__research"
    t.integer  "genuine_idea__proof"
    t.integer  "genuine_idea__processes"
    t.integer  "innovativeness__target_user_expectations"
    t.integer  "innovavativeness__genuine"
    t.integer  "innovativeness__similarity_to_other_projects"
    t.integer  "innovativeness__benefits_to_users"
    t.integer  "innovativeness__research"
    t.integer  "idea__short_history"
    t.integer  "idea__tecniques_methods"
    t.integer  "idea__verification"
    t.integer  "idea__cost_cutting_techniques"
    t.integer  "idea__new_tech_cost_cutting_advantages"
    t.integer  "industry__market_potential"
    t.integer  "industry__physibility"
    t.integer  "industry__sales_potential"
    t.integer  "industry__added_value"
    t.boolean  "final"
    t.integer  "admission_id"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.integer  "user_id"
    t.index ["admission_id"], name: "index_reviews_on_admission_id", using: :btree
    t.index ["user_id"], name: "index_reviews_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
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
    t.integer  "role"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "name"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "admissions", "users"
  add_foreign_key "reviews", "users"
end
