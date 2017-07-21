class AddOwnerDobToCustomer < ActiveRecord::Migration[5.1]
  def change
     add_column :customers, :owner, :string
     add_column :customers, :dob, :date
  end
end
