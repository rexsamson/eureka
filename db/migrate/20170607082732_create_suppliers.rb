class CreateSuppliers < ActiveRecord::Migration[5.1]
  def change
    create_table :suppliers do |t|
      t.string :code
      t.string :name
      t.string :cp
      t.string :telp
      t.decimal :climit, precision: 15, scale:2
      t.decimal :dlimit, precision: 15, scale:2
      t.string :status
      t.string :group
      t.integer :branch_id
      t.string :slug, unique: true
      t.timestamps
    end
  end
end
