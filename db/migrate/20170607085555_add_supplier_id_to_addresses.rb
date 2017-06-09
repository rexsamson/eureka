class AddSupplierIdToAddresses < ActiveRecord::Migration[5.1]
  def change
    add_column :addresses, :supplier_id, :integer
  end
end
