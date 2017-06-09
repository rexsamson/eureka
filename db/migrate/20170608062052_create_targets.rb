class CreateTargets < ActiveRecord::Migration[5.1]
  def change
    create_table :targets do |t|
      t.date :startfrom
      t.date :finishdate
      t.integer :targetbox
      t.decimal :targetsales, precision: 15, scale:2
      t.string :note
      t.integer :salesman_id
    end
  end
end
