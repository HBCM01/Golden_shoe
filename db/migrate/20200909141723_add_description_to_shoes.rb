class AddDescriptionToShoes < ActiveRecord::Migration[6.0]
  def change
    add_column :shoes, :description, :text
  end
end
