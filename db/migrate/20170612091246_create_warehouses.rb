class CreateWarehouses < ActiveRecord::Migration[5.1]
  def change
    create_table :warehouses do |t|
      t.string :code
      t.string :name
      t.string :description
      t.integer :branch_id
      t.string :slug, unique: true
    end
  end
end
