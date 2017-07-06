class CreateLedgers < ActiveRecord::Migration[5.1]
  def change
    create_table :ledgers do |t|
      t.integer :journal_id
      t.string :coa
      t.decimal :debit, precision: 15, scale:2
      t.decimal :credit, precision: 15, scale:2
      t.string :note
    end
  end
end
