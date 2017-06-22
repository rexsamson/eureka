class CreateAssetms < ActiveRecord::Migration[5.1]
  def change
    create_table :assetms do |t|
      t.string :code
      t.string :name
      t.string :category
      t.string :location
      t.string :unit
      t.decimal :value, precision: 15, scale:2
      t.date :date
      t.string :warranty
      t.string :status
      t.string :serial
      t.string :description
      t.string :slug, unique: true
      t.integer :branch_id
      t.timestamps
    end
  end
end
