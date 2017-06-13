class AddWarehouseIdToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :warehouse_id, :integer
  end
end
