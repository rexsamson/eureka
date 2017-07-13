class ChangeFromInventories < ActiveRecord::Migration[5.1]
  def change
    remove_column :inventories, :category_id, :string
    add_column :inventories, :category, :string
  end
end
