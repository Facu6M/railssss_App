class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table "products", force: :cascade do |t|
      t.string "name"
      t.string "reference"
      t.text "description"
      t.text "capacitaciones"
      t.text "cargo"
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
    end
  end
end
