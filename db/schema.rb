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

ActiveRecord::Schema[8.0].define(version: 2025_05_07_085832) do
  create_table "scan_config_hosts_ranges", force: :cascade do |t|
    t.integer "config_id", null: false
    t.integer "start"
    t.integer "finish"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["config_id"], name: "index_scan_config_hosts_ranges_on_config_id"
  end

  create_table "scan_config_ports_ranges", force: :cascade do |t|
    t.integer "config_id", null: false
    t.integer "start"
    t.integer "finish"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["config_id"], name: "index_scan_config_ports_ranges_on_config_id"
  end

  create_table "scan_configs", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "unit_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["unit_id"], name: "index_scan_configs_on_unit_id"
  end

  create_table "scan_results", force: :cascade do |t|
    t.integer "task_id", null: false
    t.string "host"
    t.integer "port"
    t.string "protocol"
    t.string "state"
    t.string "service"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["task_id"], name: "index_scan_results_on_task_id"
  end

  create_table "scan_tasks", force: :cascade do |t|
    t.integer "config_id", null: false
    t.integer "status"
    t.string "job_id"
    t.integer "process_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["config_id"], name: "index_scan_tasks_on_config_id"
  end

  create_table "units", force: :cascade do |t|
    t.string "name"
    t.integer "kind"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.integer "kind"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "scan_config_hosts_ranges", "scan_configs", column: "config_id"
  add_foreign_key "scan_config_ports_ranges", "scan_configs", column: "config_id"
  add_foreign_key "scan_configs", "units"
  add_foreign_key "scan_results", "scan_tasks", column: "task_id"
  add_foreign_key "scan_tasks", "scan_configs", column: "config_id"
end
