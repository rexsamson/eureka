class CreateSalesmen < ActiveRecord::Migration[5.1]
  def change
    create_table :salesmen do |t|
      t.string :name
      t.string :code
      t.date :dbirth
      t.string :identity
      t.string :status
      t.timestamps
    end
  end
end
