class AddSlugToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :slug, :integer, unique: true
  end
end