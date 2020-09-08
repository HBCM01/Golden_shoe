class CreateShoes < ActiveRecord::Migration[6.0]
  def change
    create_table :shoes do |t|
      t.string :name
      t.integer :stock_level
      t.integer :price
      t.string :material
      t.string :colour
      t.string :category
      t.string :department
      t.string :brand
      t.integer :size
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
