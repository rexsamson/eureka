class CreateTransactionLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :transaction_logs do |t|
      t.string :code
      t.string :form
      t.string :action
      t.integer :user_id
      t.integer :branch_id
      t.timestamps
    end
  end
end
