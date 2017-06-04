class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.string :name
      t.string :address
      t.string :region
      t.string :city
      t.string :status
      t.string :description
      t.integer :branch_id
      t.integer :customer_id
      t.timestamps
    end
  end
end
