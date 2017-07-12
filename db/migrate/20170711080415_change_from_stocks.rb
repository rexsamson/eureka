class ChangeFromStocks < ActiveRecord::Migration[5.1]
  def change
    add_column :stocks, :slug, :string
    add_column :stocks, :menu, :string
    add_column :stocks, :created_at, :datetime
    add_column :stocks, :updated_at, :datetime
  end
end
