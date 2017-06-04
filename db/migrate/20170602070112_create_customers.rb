class CreateCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :customers do |t|
      t.string :code
      t.string :name
      t.string :group
      t.string :cp
      t.string :status
      t.float :climit
      t.float :dlimit
      t.float :tclimit
      t.float :tdlimit
      t.integer :branch_id
      t.timestamps
    end
  end
end
