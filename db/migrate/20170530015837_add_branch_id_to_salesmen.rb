class AddBranchIdToSalesmen < ActiveRecord::Migration[5.1]
  def change
    add_column :salesmen, :branch_id, :integer
  end
end
