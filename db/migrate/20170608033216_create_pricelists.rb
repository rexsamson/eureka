class CreatePricelists < ActiveRecord::Migration[5.1]
  def change
    create_table :pricelists do |t|
      t.string :name
      t.integer :inventory_id
      t.decimal :price, precision: 15, scale:2
      t.decimal :cogs, precision: 15, scale:2
      t.string :startfrom
      t.integer :group_id
      t.timestamps
    end
  end
end
