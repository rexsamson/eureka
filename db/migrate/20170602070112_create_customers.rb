class CreateCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :customers do |t|
      t.string :code
      t.string :name
      t.string :group
      t.string :cp
      t.string :status
      t.decimal :climit, precision: 15, scale:2
      t.decimal :dlimit, precision: 15, scale:2
      t.decimal :tclimit, precision: 15, scale:2
      t.decimal :tdlimit, precision: 15, scale:2
      t.integer :branch_id
      t.string :slug, unique: true
      t.timestamps
    end
  end
end
