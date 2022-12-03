
ActiveRecord::Schema.define(version: 2022_12_03_172257) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bands", force: :cascade do |t|
    t.string "name"
    t.integer "year_formed"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "records", force: :cascade do |t|
    t.string "title"
    t.integer "format_size"
    t.integer "release_year"
    t.boolean "color_vinyl"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "band_id"
    t.index ["band_id"], name: "index_records_on_band_id"
  end

  add_foreign_key "records", "bands"
end
