class ChangeTypeFromProductSettings < ActiveRecord::Migration[5.1]
  def change
    remove_column :product_settings, :type, :string
    add_column :product_settings, :product_type, :string
  end
end
