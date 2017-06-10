class CreateProductSettings < ActiveRecord::Migration[5.1]
  def change
    create_table :product_settings do |t|
      t.string :code
      t.string :name
      t.string :type
      t.integer :branch_id
      t.string :slug, unique: true
    end
  end
end
