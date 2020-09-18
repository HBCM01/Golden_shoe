class CreateBasketItems < ActiveRecord::Migration[6.0]
  def change
    create_table :basket_items do |t|
      t.references :shoe, null: false, foreign_key: true
      t.belongs_to :basket, null: false, foreign_key: true

      t.timestamps
    end
  end
end
