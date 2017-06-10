class CreateInventories < ActiveRecord::Migration[5.1]
  def change
    create_table :inventories do |t|
      t.string :name
      t.integer :product_id
      t.integer :warehouse_id
      t.integer :quantity
      t.string :category_id
      t.integer :branch_id
      t.string :slug, unique: true
    end
  end
end
