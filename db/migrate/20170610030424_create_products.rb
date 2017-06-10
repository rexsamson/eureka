class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :code
      t.string :name
      t.string :kw
      t.string :category_id
      t.integer :branch_id
      t.string :slug, unique: true
    end
  end
end
