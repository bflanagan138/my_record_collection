
ActiveRecord::Schema.define(version: 2022_12_03_170645) do

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
  end

end
