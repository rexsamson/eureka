class CreateAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts do |t|
      t.string :code
      t.string :label
      t.string :du
      t.string :dk
      t.string :header
      t.string :description
      t.string :slug, unique: true
      t.timestamps
    end
  end
end