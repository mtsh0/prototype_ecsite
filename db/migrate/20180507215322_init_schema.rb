class InitSchema < ActiveRecord::Migration
  def up
    create_table "cartitems", force: :cascade do |t|
      t.integer  "quantity",   limit: 4
      t.integer  "user_id",    limit: 4
      t.integer  "item_id",    limit: 4
      t.datetime "created_at"
      t.datetime "updated_at"
    end
    create_table "contacts", force: :cascade do |t|
      t.integer  "user_id",     limit: 4
      t.string   "type",        limit: 255
      t.string   "title",       limit: 255
      t.text     "description", limit: 65535
      t.string   "image",       limit: 255
      t.datetime "created_at"
      t.datetime "updated_at"
    end
    create_table "genres", force: :cascade do |t|
      t.string   "name",       limit: 255
      t.datetime "created_at"
      t.datetime "updated_at"
    end
    create_table "infos", force: :cascade do |t|
      t.string   "title",       limit: 255
      t.string   "description", limit: 255
      t.datetime "created_at"
      t.datetime "updated_at"
    end
    create_table "items", force: :cascade do |t|
      t.integer  "itemCodeNo",  limit: 4
      t.string   "partNumber",  limit: 255
      t.string   "itemName",    limit: 255
      t.integer  "genre_id",    limit: 4
      t.integer  "subgenre_id", limit: 4
      t.float    "price",       limit: 24
      t.string   "description", limit: 255
      t.string   "attention",   limit: 255
      t.string   "mainImage",   limit: 255
      t.string   "image2",      limit: 255
      t.string   "image3",      limit: 255
      t.datetime "created_at"
      t.datetime "updated_at"
    end
    create_table "positions", force: :cascade do |t|
      t.string   "title",       limit: 255
      t.string   "description", limit: 255
      t.string   "address",     limit: 255
      t.float    "latitude",    limit: 24
      t.float    "longitude",   limit: 24
      t.datetime "created_at"
      t.datetime "updated_at"
    end
    create_table "profiles", force: :cascade do |t|
      t.integer  "user_id",       limit: 4
      t.string   "name",          limit: 255, null: false
      t.string   "name_kana",     limit: 255, null: false
      t.string   "postal_code",   limit: 255, null: false
      t.string   "prefecture_id", limit: 255, null: false
      t.string   "city",          limit: 255, null: false
      t.string   "street",        limit: 255, null: false
      t.string   "others",        limit: 255
      t.datetime "created_at",                null: false
      t.datetime "updated_at",                null: false
    end
    create_table "subgenres", force: :cascade do |t|
      t.string   "name",       limit: 255
      t.datetime "created_at"
      t.datetime "updated_at"
    end
    create_table "users", force: :cascade do |t|
      t.string   "email",                  limit: 255, default: "", null: false
      t.string   "encrypted_password",     limit: 255, default: "", null: false
      t.string   "reset_password_token",   limit: 255
      t.datetime "reset_password_sent_at"
      t.datetime "remember_created_at"
      t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
      t.datetime "current_sign_in_at"
      t.datetime "last_sign_in_at"
      t.string   "current_sign_in_ip",     limit: 255
      t.string   "last_sign_in_ip",        limit: 255
      t.datetime "created_at",                                      null: false
      t.datetime "updated_at",                                      null: false
    end
    add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
    add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  def down
    raise ActiveRecord::IrreversibleMigration, "The initial migration is not revertable"
  end
end
