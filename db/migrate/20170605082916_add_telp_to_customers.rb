class AddTelpToCustomers < ActiveRecord::Migration[5.1]
  def change
    add_column :customers, :telp, :string
  end
end
