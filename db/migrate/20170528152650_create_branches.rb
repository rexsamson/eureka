class CreateBranches < ActiveRecord::Migration[5.1]
  def change
    create_table :branches do |t|
      t.string :code
      t.string :name
      t.string :region
      t.string :city
      t.string :address
      t.string :telp
      t.string :cp
      t.string :description
      t.timestamps
    end
  end
end
