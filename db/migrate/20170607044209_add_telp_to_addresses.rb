class AddTelpToAddresses < ActiveRecord::Migration[5.1]
  def change
    add_column :addresses, :telp, :string
  end
end
