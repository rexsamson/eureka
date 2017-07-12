class ChangeTypeFromInventories < ActiveRecord::Migration[5.1]
  def change
    remove_column :inventories, :name, :string
    add_column :inventories, :code, :string
    add_column :inventories, :stock_id, :integer
  end
end
