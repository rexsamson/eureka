class AddSlugToProductsSettings < ActiveRecord::Migration[5.1]
  def change
    add_column :product_settings, :slug, :string, unique: true
  end
end
