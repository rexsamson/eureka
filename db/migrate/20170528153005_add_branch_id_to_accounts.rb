class AddBranchIdToAccounts < ActiveRecord::Migration[5.1]
  def change
    add_column :accounts, :branch_id, :integer
  end
end
