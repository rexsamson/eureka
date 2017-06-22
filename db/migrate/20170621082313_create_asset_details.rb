class CreateAssetDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :asset_details do |t|
      t.string :category
      t.date :date
      t.string :note
      t.decimal :value, precision: 15, scale:2
      t.integer :assetm_id
    end
  end
end
