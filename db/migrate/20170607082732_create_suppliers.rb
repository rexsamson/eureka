class CreateSuppliers < ActiveRecord::Migration[5.1]
  def change
    create_table :suppliers do |t|
      t.string :code
      t.string :name
      t.string :cp
      t.string :telp
      t.float :climit
      t.float :dlimit
      t.string :status
      t.string :group
      t.integer :branch_id
      t.timestamps
    end
  end
end
