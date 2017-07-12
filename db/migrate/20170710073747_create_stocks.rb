class CreateStocks < ActiveRecord::Migration[5.1]
  def change
    create_table :stocks do |t|
      t.string :code
      t.date :date
      t.string :status
      t.string :description
      t.integer :branch_id
    end
  end
end
