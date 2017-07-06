class CreateJournals < ActiveRecord::Migration[5.1]
  def change
    create_table :journals do |t|
      t.string :code
      t.date :date
      t.string :description
      t.string :status
      t.decimal :total, precision: 15, scale:2
      t.string :slug, unique: true
      t.integer :branch_id
      t.timestamps
    end
  end
end
